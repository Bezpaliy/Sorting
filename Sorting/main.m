//
//  main.m
//  Sorting
//
//  Created by Igor Bezpalyy on 2/22/17.
//  Copyright © 2017 Безпалый Игорь. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StableSortingAlgorithms.h"

static const int kArrayCount = 10;
static const int kMaxItems = 20;

int main()
{
	int* items = malloc( kMaxItems * sizeof(int));
	
	srand((unsigned)time(NULL));
	for (int i = 0; i < kArrayCount; i++)
	{
		items[i] =  rand() % kMaxItems + 1;
	}

//	for (int i = 0; i < kArrayCount; i++)
//	{
//		printf("Element[%d] = %d\n", i, items[i] );
//	}
	
	int countOfItterations = 0;
	int countOfSwap = 0;
	double sortedTime = 0.0;

	int* newItems =  malloc( kMaxItems * sizeof(int));;
	memcpy( newItems, items, kArrayCount * sizeof(*items) ); //

	BubbleSortItems(newItems, kArrayCount, &countOfItterations, &countOfSwap, &sortedTime);

	free(newItems);
	printf("Finish BubbleSort => %d : %d :  %f \n", countOfItterations, countOfSwap, sortedTime);
	
	countOfItterations = 0;
	countOfSwap = 0;
	sortedTime = 0.0;
	newItems =  malloc( kMaxItems * sizeof(int));;
	memcpy( newItems, items, kArrayCount * sizeof(*items) ); //
	for (int i = 0; i < kArrayCount; i++)
	{
		printf("AAA[%d] = %d\n", i, newItems[i] );
	}
	CocktailSortItems(newItems, kArrayCount, &countOfItterations, &countOfSwap, &sortedTime);
	
	for (int i = 0; i < kArrayCount; i++)
	{
		printf("Sorted Element[%d] = %d\n", i, newItems[i] );
	}
	free(newItems);
	printf("Finish CocktailSort => %d : %d :  %f \n", countOfItterations, countOfSwap, sortedTime);
	
	
	free(items);
	printf("--------------------------------------------------------\n");
	return 0;
}
