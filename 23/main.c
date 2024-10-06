#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

uint32_t is_abundant(uint32_t n){
	uint32_t sum = 1;
	uint32_t k = n;
	for(uint32_t i = 2; i <= n; i++){
		uint32_t p = 1;
		while(k % i == 0){
			p *= i;
			k /= i;
		}
		sum *= (p*i - 1)/(i-1);
	}
	return 2*n < sum;
}


int main(void){
	const int limit = 28123;
	uint32_t* abundants;
	uint32_t abundants_cnt = 0;
	uint8_t* expressed;
	uint64_t sum = 0;

	for(uint32_t i = 1; i < 28123; i++){
		if(is_abundant(i)){
			abundants_cnt++;
		}
	}

	printf("%d\n", abundants_cnt);

	abundants = malloc(abundants_cnt * sizeof(uint32_t));
	uint32_t j = 0;
	for(uint32_t i = 1; i < limit; i++){
		if(is_abundant(i)){
			abundants[j++] = i;
		}
	}

	expressed = calloc(limit, 1);
	for(uint32_t i = 0; i < abundants_cnt; i++){
		for(uint32_t z = i; z < abundants_cnt; z++){
			uint32_t k = abundants[i] + abundants[z];
			if(k >= limit){break;}
			expressed[k-1] = 1;
		}
	}

	for(uint32_t i = 1; i < limit; i++){
		if(!expressed[i-1]){
			sum += i;
		}
	}

	printf("%ld\n", sum);
	return 0;
}