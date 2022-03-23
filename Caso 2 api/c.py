def CalcMaxMitad(arr, mitad):
    suma = 0
    max_izq =  -1000000
    for n in arr[mitad-1::-1]:
        suma = suma + n
        if(suma > max_izq):
            max_izq = suma
    
    suma = 0
    max_der = -1000000
    for n in arr[mitad:]:
        suma = suma + n 
        if(suma > max_der):
            max_der = suma
    
    return max_izq + max_der

def MaxArray(arr):
    if len(arr) == 1:
        return arr[0]

    #dividir
    mitad = len(arr)//2
    arr_izq = arr[0:mitad]
    arr_der = arr[mitad:]

    #conquistar
    max_izq = MaxArray(arr_izq)
    max_der = MaxArray(arr_der)
    max_mitad = CalcMaxMitad(arr,mitad)

    #combinar
    return max(max_izq,max_der,max_mitad)


print(MaxArray([1,5,-1,6,-7,4]))
