@echo off
echo �������ι������� : v1.0.1
echo ������Ʈ �������� : v220713_05_03
echo made by LJS
:start
echo ------------------------------------------
echo ## 1. ����
echo ## 2. �Ҹ�
set /p choice = ���� : 
CLS
if choice == 1 goto NN
if choice == 2 goto SS
:NN
echo ------------------------------------------
echo ���� Ŭ����
echo	01	����Ŭ����			���ϸ�����
echo		�ܼ� '��з�'�̸�, ���ϸ����� ������.
echo		00	01	�������		
echo		00	02	������		
echo		00	03	����		
echo		00	04	�ü���		
echo		00	05	��Ÿ����		
@echo	------------------------------------------
echo	02	����Ŭ����(��)	
echo 		�����ϸ� �Է¿� �ʿ��� ����
echo		01	01	�����ۼ���		01_01_800_...
echo		01	02	ö�ο�ۼ���		01_02_800_...
echo		01	03	�װ���ۼ���		01_03_800_...
echo		01	04	�����ۼ���		01_04_800_...
echo		02	01	��������		02_01_800_...
echo		02	02	��������		02_02_800_...
echo		03	01	��������		03_01_800_...
echo		04	01	�ǳ��ü�		04_01_800_...
echo		04	02	�ǿܽü�		04_02_800_...
echo		05	01	�ǳ���Ÿ����		05_01_800_...
echo		05	02	�ǿܱ�Ÿ����		05_02_800_...
@echo	------------------------------------------
pause
CLS
goto start
:SS
@echo	------------------------------------------
echo	03	�Ҹ�Ŭ����
echo 		�����ϸ� �Է¿� �ʿ��� ����
echo		00	01	����Ǻ������Ҹ�	00_01_700_220713_001_SS
echo		00	02	�������ڿ����Ҹ�	00_02_700_...
echo		00	03	������ǰ�׻�Ȱȯ��Ҹ�	00_03_700_...
echo		00	04	��Ÿ�Ҹ�		00_04_700_...
echo	------------------------------------------
echo	04	�Ҹ�Ŭ����(��)
echo 		�ٿ����ۼ���
echo		01	01	��ü�Ҹ�			
echo		01	02	��������			
echo		01	03	Ÿ�ݼҸ�			
echo		02	01	�����Ҹ�			
echo		02	02	�ڿ����Ҹ�		
echo		03	01	������ǰ			
echo		03	02	��Ȱȯ��			
echo		04	01	���ռҸ�			
echo	------------------------------------------
echo	05	��ȭ����	
echo		00	01	���� �� ����		
echo		00	02	�ְſ� ����		
echo		00	03	��ŷ�(����)		
echo		00	04	������			
echo		00	05	���� ����		
echo		00	06	������ ����		
echo		00	07	�ϰ� ����			
echo		00	08	��� �� ����	
@echo	------------------------------------------	
pause
CLS
goto start