-- sql day 02
------------------------------------------------------------------------------------------------
-- IS NULL, IS NOT NULL ������
/*

IS NULL : ���Ϸ��� �÷��� ���� NULL �̸� true, NULL �� �ƴϸ� false
IS NOT NULL : ���Ϸ��� �÷��� ���� NULL �� �ƴϸ� true, NULL �̸� false

NULL ���� �÷��� �񱳿����ڿ� ������ �Ұ��� �ϹǷ�
NULL �� �� �����ڰ� ���� ������

col1 = null ==> NULL ���� ���ؼ��� = �� ������ ��� �Ұ���
col1 ! = null ==> NULL ���� ���ؼ��� !=, <> �� ������ ��� �Ұ���
*/

--- 27) � ������ mgr�� �������� ���� ������ ����
SELECT e.EMPNO
     , e.ENAME
     , e.MGR
  FROM emp e
 WHERE e.MGR IS NULL
;
*/
EMPNO, ENAME, MGR
---------------------
7839	KING	
9999	J_JUNE	
8888	J	
7777	J%JONES	
*/

--- mgr�� ������ ���� ���� ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.MGR
  FROM emp e
 WHERE e.MGR IS NOT NULL
;
-- e.MGR != NULL �� ����� �� ���� 
-- e.MGR <> NULL �� ����� �� ����
/*
EMPNO, ENAME, MGR
------------------------------
7369	SMITH	7902
7499	ALLEN	7698
7521	WARD	7698
7566	JONES	7839
7654	MARTIN	7698
7698	BLAKE	7839
7782	CLARK	7839
7844	TURNER	7698
7900	JAMES	7698
7902	FORD	7566
7934	MILLER	7782
*/
-- IS NOT NULL ��� <> != �����ڸ� ����� ����� ��ȸ ��� ��
SELECT e.EMPNO
     , e.ENAME
     , e.MGR
  FROM emp e
 WHERE e.MGR <> NULL
;
-- > ����� ��� �� : 0
-- > ���࿡ ������ ������ �ùٸ� ����� �ƴ� 

-- BETWEEN ~ AND ~ : ���� �� ������ ���� ����
--- a <= sal <= b  : �̷��� ���� ����� ����

--- 28) �޿��� 500 ~ 1200 ������ ���� ���� ��ȸ
SELECT e.EMPNO
     , e.ENAME
     , e.SAL
  FROM emp e
 WHERE e.SAL BETWEEN 500 AND 1200
;

-- BETWEEN 500 AND 1200 �� ���� ����� ���� �񱳿�����
SELECT e.EMPNO
     , e.ENAME
     , e.SAL
  FROM emp e
 WHERE e.SAL >= 500
   AND e.SAL <= 1200 -- ��ȣ�� ���� �� �����ڸ� ���
;

/*-------------------
COMM != 0
COMM <> 0
NOT COMM = 0
NOT COMM IN (0)
---------------------*/

-- EXISTS ������ : ��ȸ�� ����� 1�� �̻� �ִ�.
--                � SELECT ������ �������� �� ��ȸ ����� 1�� �̻� ������
--                �� �������� ����� ture
--                ��ȸ ��� : <����� ��� �� : 0> �� ��� false
--                ���� ���������� �Բ� ����
-- EXISTS ( ��ȸ����� �ִ� OR ����) << FULL SELECT FROM

--- 29) �޿��� 10000�� �Ѵ� ����� �ִ°�?
--  (1) �޿��� 10000�� �Ѵ»���� ã�� ������ �ۼ�
SELECT e.ENAME
  FROM emp e
 WHERE e.SAL > 10000
;

/*
���� ���� ���� ����� 1�� �̶� �����ϸ� ȭ�鿡
"�޿��� 3000�� �Ѵ� ������ ������" �̶�� ���
*/

SELECT '�޿��� 3000�� �Ѵ� ������ ������' as "�ý��� �޼���"
  FROM dual
 WHERE EXISTS (SELECT e.ENAME
                 FROM emp e
                WHERE e.SAL > 3000)
;

/*
���� ���� ���� ����� 1�� �̶� �������� ������ ȭ�鿡
"�޿��� 10000�� �Ѵ� ������ �������� ����" �̶�� ���
*/

SELECT '�޿��� 10000�� �Ѵ� ������ �������� ����' as "�ý��� �޼���"
  FROM dual
 WHERE NOT EXISTS (SELECT e.ENAME
                     FROM emp e
                    WHERE e.SAL > 10000)
;

-- (6) ������ : ���տ����� || 
-- ����Ŭ���� ����, ���ڿ� ����(����)
-- �ٸ� �ڹ� ���� ���α׷��� ������ OR �� �����ڷ� ���ǹǷ�
-- ȥ���� ����

-- ������ ��¥�� ȭ�鿡 ��ȸ
SELECT sysdate
  FROM dual
;

-- ������ ��¥�� �˷��ִ� ������ �������
SELECT '������ ��¥�� ' ||sysdate|| ' �Դϴ�.' as "������ ��¥"
  FROM dual
;

-- ������ ����� �˷��ִ� ������ || �����ڸ� ����Ͽ� �ۼ�
SELECT '�ȳ��ϼ���. ' ||e.ENAME|| '��, ����� ����� ' || e.EMPNO || '�Դϴ�' "��� �˸���"
  FROM emp e
;
