*** Variables ***
${string}    kotek
@{list}    pierwszy    drugi    trzeci   czwarty    piaty
&{dictionary}     slowo=${string}   numer=69      lista=@{list}
@{list_of_numbers}    10     20      30      40      50     60
@{names}    Sara     Maciej     Zofia     Michal     Karolina      Bartosz
@{surnames}     Nowak     Kowalski     Malinowski       Polak     Grabowski     Lato

*** Test Cases ***
Nest Looops
    @{Letters}     Create List    a    b    c    d    e
    Log    ${Letters}
    @{numbers}     Create List   ${1}    ${2}    ${3}    ${4}    ${5}
    Log    ${numbers}
    FOR    ${letter}    IN    @{Letters}
        FOR   ${number}    IN    @{numbers}
            Log    ${letter} ${number}
        END
    END

For Loop in List
    FOR    ${i}    IN    @{list_of_numbers}
        IF      ${i} == 30    Log    ${i}
    END

For Loop In Dictionary
    Log     ${dictionary}
    FOR    ${keys_and_values}   IN   &{dictionary}
        Log    ${keys_and_values}
    END

For Loop In Range With Index
    FOR    ${I}    IN RANGE    3
        Log   ${names}[${i}] ${surnames}[${i}]
# $ -> lista jako calosc i pozniej cos z niej wezmiemy; @ -> zbior elementow
    END

For Loop in List
    FOR    ${i}    IN    @{list}
        Log    ${i}
    END

For Loop In Range
    FOR    ${index}    IN RANGE    10
        Log    ${index}
    END

For Loop In Range
    FOR    ${index}    IN RANGE    4    10
        Log    ${index}
    END

For Loop In Range
    FOR    ${index}    IN RANGE    4     30     2
        Log    ${index}
    END