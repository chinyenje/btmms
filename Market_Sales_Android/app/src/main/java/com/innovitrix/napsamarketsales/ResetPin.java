package com.innovitrix.napsamarketsales;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Editable;
import android.text.InputFilter;
import android.text.InputType;
import android.text.Selection;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.method.NumberKeyListener;
import android.util.Log;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.material.textfield.TextInputLayout;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import static com.innovitrix.napsamarketsales.utils.AppConstants.KEY_SERVICE_TOKEN;
import static com.innovitrix.napsamarketsales.utils.AppConstants.KEY_USERNAME_API;
import static com.innovitrix.napsamarketsales.utils.AppConstants.KEY_VOLLEY_SOCKET_TIMEOUT_MS;
import static com.innovitrix.napsamarketsales.utils.UrlEndpoints.URL_RESET_PIN;

public class ResetPin extends AppCompatActivity {
     private Button button_Save;
    private ProgressBar progressBar;
    private ProgressDialog progressDialog;
    RequestQueue queue;
    TextInputLayout  textInputLayout_NRC, textInputLayout_Mobile_Number;

    String   mobile_number, nrc;
    String pin;
    int mobile_number_char;
    String blockCharacterSet = "123456789";
    private long backPressedTime;
    private Toast backToast;
    TextView textViewUsername;
    TextView textViewDate;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //getWindow().setFlags(WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL, WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL);

        // ...but notify us that it happened.
        //getWindow().setFlags(WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH, WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH);

        setContentView(R.layout.activity_reset_pin);
        //this.setFinishOnTouchOutside(false);
        getSupportActionBar().setSubtitle("reset pin");
        progressDialog = new ProgressDialog(ResetPin.this);
        progressDialog.setMessage("Loading...");
        progressDialog.setCancelable(false);
        queue = Volley.newRequestQueue(this);

        // textViewUsername = (TextView)findViewById(R.id.textViewUsername);
        //  textViewUsername.setText("Logged in as "+SharedPrefManager.getInstance(BusBuyTicketBuyerDetailsE.this).getUser().getFirstname()+ " "+SharedPrefManager.getInstance(BusBuyTicketBuyerDetailsE.this).getUser().getLastname());
        textViewDate = (TextView)findViewById(R.id.textViewDate);
        textViewDate.setText(SharedPrefManager.getInstance(ResetPin.this).getTranactionDate2());


        textInputLayout_Mobile_Number = (TextInputLayout) findViewById(R.id.mobile_number_TextInputLayout);
        textInputLayout_NRC =  (TextInputLayout) findViewById(R.id.nrc_TextInputLayout);

        progressBar = (ProgressBar) findViewById(R.id.progressBar);
        textInputLayout_Mobile_Number.requestFocus();
        textInputLayout_NRC.setCounterEnabled(false);
        textInputLayout_Mobile_Number.getEditText().addTextChangedListener(new ResetPin.PhoneNumberTextWatcher());
        textInputLayout_Mobile_Number.getEditText().setFilters(new InputFilter[]{new ResetPin.PhoneNumberFilter(), new InputFilter.LengthFilter(10)});

        textInputLayout_NRC.getEditText().addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
             /*   if (s.length() < 1) {
                    textInputLayout.setErrorEnabled(true);
                    textInputLayout.setError("Please enter a value");
                }

                if (s.length() > 0) {
                    textInputLayout.setError(null);
                    textInputLayout.setErrorEnabled(false);
                }
*/
                textInputLayout_NRC.setError(null);

            }

            @Override
            public void afterTextChanged(Editable s) {

            }
        });

        button_Save = (Button) findViewById(R.id.buttonSubmitRP);
           button_Save.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (!validateMobileNumber()||!validateNRC()) {
                    return;
                } else {


                mobile_number =  "26"+  mobile_number;
                AlertDialog.Builder builder = new AlertDialog.Builder(ResetPin.this);;
                builder.setCancelable(false);
                builder.setMessage("Confirm pin reset for "+ mobile_number+"?");
                builder.setPositiveButton("Yes",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {

                                sendInformation( mobile_number,nrc);
                            }
                        });

                builder.setNegativeButton("No",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                dialog.cancel();
                            }
                        });

                builder.create().show();
            }}
        });
    }
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        // If we've received a touch notification that the user has touched
        // outside the app, finish the activity.
        if (MotionEvent.ACTION_OUTSIDE == event.getAction()) {
            finish();
            return true;
        }

        // Delegate everything else to Activity.
        return super.onTouchEvent(event);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                //do whatever
                Intent intent = new Intent(ResetPin.this,LoginActivity.class);
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK| Intent.FLAG_ACTIVITY_CLEAR_TOP);
                startActivity(intent);
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }}

    @Override
    public void onBackPressed() {
        // Toast.makeText(getApplication(),"Use the in app controls to navigate.",Toast.LENGTH_SHORT).show();
        Intent intent = new Intent(ResetPin.this,LoginActivity.class);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK| Intent.FLAG_ACTIVITY_CLEAR_TOP);
        startActivity(intent);
        finish();
    }

    public void sendInformation(
            final String mobile_number,
            String nrc
    )
    {
        progressBar.setVisibility(View.VISIBLE);

        JSONObject jsonAuthObject = new JSONObject();
        try {
            jsonAuthObject.put("username", KEY_USERNAME_API);
            jsonAuthObject.put("service_token", KEY_SERVICE_TOKEN);
        } catch (JSONException e) {
            e.printStackTrace();
        }


        //PAYLOAD
        JSONObject jsonPayloadObject = new JSONObject();
        try {
            jsonPayloadObject.put("mobile",mobile_number);
            jsonPayloadObject.put("nrc", nrc);

        } catch (JSONException e) {
            e.printStackTrace();
        }


        ///prepare your JSONObject which you want to send in your web service request
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("auth",jsonAuthObject);
            jsonObject.put("payload",jsonPayloadObject);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        // progressDialog.show();

        ///prepare your JSONObject which you want to send in your web service request
// Calendar.getInstance().getTime()


        // prepare the Request
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.POST,URL_RESET_PIN, jsonObject,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {

                        //Do stuff here
                        // display response

                        Log.d("Response", response.toString());
                             progressBar.setVisibility(View.GONE);

                        try {
                            //converting response to json object
                            JSONObject obj = new JSONObject(String.valueOf(response));


                            //Check if the object has the key.
                            if(obj.getJSONObject("response").getJSONObject("AUTHENTICATION").has("data")){
                                //getting the user from the response
                                progressBar.setVisibility(View.GONE);
                                AlertDialog.Builder builder = new AlertDialog.Builder(ResetPin.this);
                                builder.setCancelable(false);
                                builder.setMessage("Your pin has been reset. You will soon receive an SMS on "+ mobile_number+" with an one time pin (OTP).");
                                builder.setPositiveButton("Ok",
                                        new DialogInterface.OnClickListener() {
                                            public void onClick(DialogInterface dialog, int id) {
                                                Intent intent = new Intent(ResetPin.this,LoginActivity.class);
                                                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK| Intent.FLAG_ACTIVITY_CLEAR_TOP);
                                                startActivity(intent);
                                                finish();
                                            }
                                        });
                                builder.create().show();
//                                progressBar.setVisibility(View.GONE);
//                                Toast.makeText(getApplicationContext(),"Your pin has been reset. You will soon receive an SMS on "+ mobile_number+" with an one time pin (OTP).", Toast.LENGTH_LONG).show();
//                                Intent intent = new Intent(ResetPin.this,LoginActivity.class);
//                                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK| Intent.FLAG_ACTIVITY_CLEAR_TOP);
//                                startActivity(intent);
//                                finish();
//                                //Toast.makeText(getApplicationContext(), "Pin reset successful", Toast.LENGTH_LONG).show();
//                                //startActivity(new Intent(ResetPin.this, LoginActivity.class));
//                                //DialogBox.mLovelyStandardDialog(ResetPin.this,"Pin reset successful.");
//                                //startActivity(new Intent(ResetPin.this, LoginActivity.class));
                            }
                            else
                            {
                                progressBar.setVisibility(View.GONE);
                                AlertDialog.Builder builder = new AlertDialog.Builder(ResetPin.this);
                                builder.setCancelable(false);
                                builder.setMessage("Pin could not be reset, enter a registered mobile number and ID");
                                builder.setPositiveButton("Ok",
                                        new DialogInterface.OnClickListener() {
                                            public void onClick(DialogInterface dialog, int id) {

                                            }
                                        });
                                builder.create().show();

                            }
                        } catch (JSONException e) {
                            //     DialogBox.mLovelyStandardDialog(LoginActivity.this,e.getMessage());
                                  progressBar.setVisibility(View.GONE);

                            e.printStackTrace();


//                            AlertDialog.Builder builder = new AlertDialog.Builder(ResetPin.this);
//                            builder.setCancelable(false);
//                            builder.setMessage("Connection failure, kindly check your internet connection and try again.");
//                            builder.setPositiveButton("Ok",
//                                    new DialogInterface.OnClickListener() {
//                                        public void onClick(DialogInterface dialog, int id) {
//                                        }
//                                    });
//                            builder.create().show();
                        }

                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("Error.Response", error.toString());
                progressBar.setVisibility(View.GONE);
                AlertDialog.Builder builder = new AlertDialog.Builder(ResetPin.this);
                builder.setCancelable(false);
                builder.setMessage("Connection failure, kindly check your internet connection and try again.");
                builder.setPositiveButton("Ok",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                //Intent intent = new Intent(ResetPin.this,LoginActivity.class);
                               // startActivity(intent);
                            }
                        });
                builder.create().show();

//                       Log.d("Error.Response", error.getMessage());
                //   startActivity(new Intent(LoginActivity.this, MainActivity.class)); //TODO Change when the API server is reachable

                //DialogBox.mLovelyStandardDialog(ResetPin.this,   "Connection failure.");
                // progressBar.setVisibility(View.GONE);
                // Toast.makeText(getApplicationContext(), error.getMessage(), Toast.LENGTH_SHORT).show();
            }
        }) {
            @Override

            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                // params.put("username", trader_id);
                //params.put("email", firstname);
                // params.put("password", lastname);
                params.put("mobile_number", mobile_number );
                return params;
            }
        };

        jsonObjectRequest.setRetryPolicy(new DefaultRetryPolicy(KEY_VOLLEY_SOCKET_TIMEOUT_MS,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));

        //  VolleySingleton.getInstance(this).addToRequestQueue(stringRequest);
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(jsonObjectRequest);

    }

    public class PhoneNumberTextWatcher implements TextWatcher {

        private boolean isFormatting;
        private boolean deletingHyphen;
        private int hyphenStart;
        private boolean deletingBackward;

        @Override
        public void afterTextChanged(Editable text) {
            if (isFormatting)
                return;

            isFormatting = true;

            // If deleting hyphen, also delete character before or after it
            if (deletingHyphen && hyphenStart > 0) {
                if (deletingBackward) {
                    if (hyphenStart - 1 < text.length()) {
                        text.delete(hyphenStart - 1, hyphenStart);
                    }
                } else if (hyphenStart < text.length()) {
                    text.delete(hyphenStart, hyphenStart + 1);
                }
            }
            if (text.length() == 4 || text.length() == 8) {
                text.append('-');
            }

            isFormatting = false;
        }

        @Override
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            if (isFormatting)
                return;

            // Make sure user is deleting one char, without a selection
            final int selStart = Selection.getSelectionStart(s);
            final int selEnd = Selection.getSelectionEnd(s);
            if (s.length() > 1 // Can delete another character
                    && count == 1 // Deleting only one character
                    && after == 0 // Deleting
                    && s.charAt(start) == '-' // a hyphen
                    && selStart == selEnd) { // no selection
                deletingHyphen = true;
                hyphenStart = start;
                // Check if the user is deleting forward or backward
                if (selStart == start + 1) {
                    deletingBackward = true;
                } else {
                    deletingBackward = false;
                }
            } else {
                deletingHyphen = false;
            }
        }

        @Override
        public void onTextChanged(CharSequence s, int start, int before, int count) {

            textInputLayout_Mobile_Number.setError(null);
            mobile_number = textInputLayout_Mobile_Number.getEditText().getText().toString().trim();
          mobile_number.length();

            if ( mobile_number.length()== 0)
                blockCharacterSet = "123456789";

            else
                blockCharacterSet = "";
            if ( mobile_number.length() == 1)
                blockCharacterSet = "0";
        }
    }

    public class PhoneNumberFilter extends NumberKeyListener {

        @Override
        public int getInputType() {
            return InputType.TYPE_CLASS_PHONE;
        }

        @Override
        protected char[] getAcceptedChars() {
            return new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-'};
        }

        @Override
        public CharSequence filter(CharSequence source, int start, int end,
                                   Spanned dest, int dstart, int dend) {

            try {
                // Don't let phone numbers start with 1


                if (source != null && blockCharacterSet.contains("" + source.charAt(0)))
                    return "";


                //if (dstart == 0 && source.equals("1"))
                //   return "";

                if (end > start) {
                    String destTxt = dest.toString();
                    String resultingTxt = destTxt.substring(0, dstart) + source.subSequence(start, end) + destTxt.substring(dend);

                    // Phone number must match xxx-xxx-xxxx
                    if (!resultingTxt.matches("^\\d{0,1}(\\d{1,1}(\\d{1,1}(\\d{1,1}(\\d{1,1}(\\d{1,1}(\\d{1,1}(\\d{1,1}(\\d{1,1}(\\d{1,1}?)?)?)?)?)?)?)?)?)?")) {
                        //   if (!resultingTxt.matches("^\\d{1,1}(\\d{1,1}(\\d{1,1}(\\-(\\d{1,1}(\\d{1,1}(\\d{1,1}(\\-(\\d{1,1}(\\d{1,1}(\\d{1,1}(\\d{1,1}?)?)?)?)?)?)?)?)?)?)?)?")) {

                        return "";
                    }
                }
                return null;
            } catch (StringIndexOutOfBoundsException e) {

            }
            return null;
        }
    }

    private boolean validateMobileNumber() {
        mobile_number = textInputLayout_Mobile_Number.getEditText().getText().toString().trim();
        if (mobile_number.isEmpty() | mobile_number.length() < 10) {
            textInputLayout_Mobile_Number.setErrorEnabled(true);
            textInputLayout_Mobile_Number.setError("Enter your 10 digit registered mobile number(0xxxxxxxxx).");
            textInputLayout_Mobile_Number.requestFocus();
            return false;

        } else {
            textInputLayout_Mobile_Number.setError(null);
            return true;
        }
    }


    private boolean validateNRC() {
        nrc = textInputLayout_NRC.getEditText().getText().toString().trim();
        if (nrc.isEmpty() | nrc.length() < 5) {
            textInputLayout_NRC.setErrorEnabled(true);
            textInputLayout_NRC.setError("Enter ID used to register.");
            textInputLayout_NRC.requestFocus();
            return false;

        } else {
            textInputLayout_NRC.setError(null);
            return true;
        }
    }


}
