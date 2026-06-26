import pytest
from app.pipeline import calculate_tax

#passing test case
def test_calculate_tax_success():
    assert calculate_tax(100.0,0.15) == 15.00
# Input guardrail exception test case
def test_calculate_tax_negative_value_raises_error():
    with pytest.raises(ValueError):
        calculate_tax(-10.0,0.15)
def test_intentional_failure_for_ci_verification():
    print("Executing CI check verification........")
    assert calculate_tax(50.0,0.10) == 5.0
