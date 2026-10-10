package com.example.thuchanh3

import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {

    private lateinit var etNum1: EditText
    private lateinit var etNum2: EditText
    private lateinit var tvResult: TextView
    private var selectedOperator: String = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        etNum1 = findViewById(R.id.etNum1)
        etNum2 = findViewById(R.id.etNum2)
        tvResult = findViewById(R.id.tvResult)

        val btnAdd = findViewById<Button>(R.id.btnAdd)
        val btnSub = findViewById<Button>(R.id.btnSub)
        val btnMul = findViewById<Button>(R.id.btnMul)
        val btnDiv = findViewById<Button>(R.id.btnDiv)

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        val buttons = listOf(btnAdd, btnSub, btnMul, btnDiv)

        btnAdd.setOnClickListener { selectOperator("+", buttons, btnAdd) }
        btnSub.setOnClickListener { selectOperator("-", buttons, btnSub) }
        btnMul.setOnClickListener { selectOperator("*", buttons, btnMul) }
        btnDiv.setOnClickListener { selectOperator("/", buttons, btnDiv) }

        val textWatcher = object : TextWatcher {
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
                calculateResult()
            }
            override fun afterTextChanged(s: Editable?) {}
        }

        etNum1.addTextChangedListener(textWatcher)
        etNum2.addTextChangedListener(textWatcher)
    }

    private fun selectOperator(operator: String, allButtons: List<Button>, selectedButton: Button) {
        selectedOperator = operator
        for (btn in allButtons) {
            btn.alpha = if (btn == selectedButton) 1.0f else 0.4f
        }
        calculateResult()
    }

    private fun calculateResult() {
        val num1Str = etNum1.text.toString()
        val num2Str = etNum2.text.toString()

        if (num1Str.isEmpty() || num2Str.isEmpty() || selectedOperator.isEmpty()) {
            tvResult.text = "Kết quả:"
            return
        }

        val num1 = num1Str.toDoubleOrNull() ?: 0.0
        val num2 = num2Str.toDoubleOrNull() ?: 0.0
        var result = 0.0

        when (selectedOperator) {
            "+" -> result = num1 + num2
            "-" -> result = num1 - num2
            "*" -> result = num1 * num2
            "/" -> {
                if (num2 == 0.0) {
                    tvResult.text = "Kết quả: Lỗi chia cho 0"
                    return
                }
                result = num1 / num2
            }
        }

        val isWholeNumber = result % 1 == 0.0
        val finalResultString = if (isWholeNumber) result.toInt().toString() else result.toString()

        tvResult.text = "Kết quả: $finalResultString"
    }
}