Return-Path: <linux-doc+bounces-23916-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B0D9603F7
	for <lists+linux-doc@lfdr.de>; Tue, 27 Aug 2024 10:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27F2D1C21022
	for <lists+linux-doc@lfdr.de>; Tue, 27 Aug 2024 08:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3448413D53F;
	Tue, 27 Aug 2024 08:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="sNw1sdcE"
X-Original-To: linux-doc@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4892D12FF71
	for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 08:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724746049; cv=none; b=UPhhV3Te8sgGkRi1HmfsaoAmLHkA6q8Laz3PNxrUUVc5LlH16X2puJf66m/R3DT+kqNVsZ0iJmjrrVK94gnMLELIuaIFc40ZT+NAFFu7X7mAxjoQExHyDsUCY4ycvcUkBdx4ACLfXX+qYGTmhkmqwdgMzAf/mkwaeSZ9PsFqwHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724746049; c=relaxed/simple;
	bh=brxIHIhoJFw108t/+E6yNWww1AL7fWvuY4Jx+V5yz6k=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=u7z9y24wdTcj6NXlqAXS9Ou9hK2g3xBNz5MDt7Ggo9W2fBLna5azxtvqnS0+60X/Mn9P6k92J7K5URRHxw1W0jUwPn9vV+lFoGVVZPgADGl42Vt4A/REgZ/lp1/+zkp9NWtFQ2PPWVARdDJx9bx3/hfpm28BfOuCYNF9/33kQvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name; spf=none smtp.mailfrom=cyyself.name; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=sNw1sdcE; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cyyself.name
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1724746042; bh=CgMtB9NDiiOVMtrdwmpIxkXfBYM+Acie7PSpkw7YuOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sNw1sdcEAEKUqy02bV0l2cY6Qq/tDYoIT3/xQ4gSJ5hbCorov22PI9TBH9A1O53OW
	 O/R+g3Tp8iddJI1NwD7jqGqY/82dXJEvecvPARiLX0XW7SbG5ZnHSKP+NA28rweG3P
	 Nb+YjV20SAJQhERtN+OUkjPvS+7b7r1siesaqN8k=
Received: from cyy-pc.lan ([240e:379:224b:5f00:16b6:fb41:2849:da9d])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 1CBA7234; Tue, 27 Aug 2024 16:07:11 +0800
X-QQ-mid: xmsmtpt1724746031tezlmmzao
Message-ID: <tencent_04326B0F3A92E012C75885103756F081080A@qq.com>
X-QQ-XMAILINFO: OaubouGXmhNzKe8gtNppzHDxLG7c3mFvh6NtIPeJyusxWfaLbmxKeF7Vq1moLz
	 Yzqmo2u4gO9I8sHODtIT1ur8ndKDpu5N+8CNRUG5Y1gKKXu6xdTBIJwS0DKgbl1uzntqrdlTzPEu
	 vKmz6N5cbn9ql5cbuk/srU7/19hiZpVtwVng5ThGr6krXsN0tr8MCAXhFkEL2W8B8RI39TMFuCKA
	 M/ZA+Vj96OdLAvi6+YbDpM5XkWhIt15q+B2F+R3j4Vv5PB0WJdk734Wkyn/xUdCyWHhWirS6I+Pc
	 UZgDVN4MyherF+Q1bvByOC+tZr8Pisfe2UI8NtdlfP4U/Md1+pl9MddrZ0mbX5Th6SmxzwZo9hfq
	 VAKCr9OdCpQg8RyjuBDpIAgz4hM0z52aEEsgtIJeDOND7jaZokLljeu8i2zpC/eWnIxakbGwN/08
	 TakhPOAYZKQ3EKqH+EpyZFegUFyt9KgoF8/AdpqDchrNEBtGs0HNHpTMyFoNCwpHj5wrGNNim+9G
	 GDH6mdzM7RXFX7riLYSdq2sp5Qmcgb2MdsdStHqwGjgwMMHysDtZ7NOmR2XFv/Zk+ue4IcpafiER
	 rQFSlyL9lEm1og3ui0JMhUhDa4gcJWhqAnew2VVipfcf/YKa0ZuLZf1ABPq9w1bpu81LZm3rR4xv
	 2Izlo79ZTWPwYyLBXTQy8MeSfgK4k0mhEQsvutcLVEdveucF4tX+vne8X9umbpSP+0kQ7WEyX0+l
	 YQrhcGEUCizd49cpdrPZYHyJtHUc4oZpVG//bxqq0SAs9EHe6I1rHQJx/emQjMwSy0tERi6P2txl
	 yibVxH7WohvEXPc6g04rIteIrrkeaey+2NedUFVkNYPnuRP0MPXPxlip/4YXtn4FNum6E6QJvdr7
	 rbOC8HF6WxDG9+WPPziNNTaV8t7NxKhpokzooMrjbd3hWvNmFwfhdxAGZqVZhoUGXgM40dHd9j8p
	 uTv1oKBqoFiiJbbsVjbILgh7kFfLXOS10ssdMaKZYQ2Ixk2OGfKWl2C6UdCkV0IwIMRHX5m7mMoP
	 f2e1YisQ==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Levi Zim <rsworktech@outlook.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-kselftest@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v3 1/3] riscv: selftests: Remove mmap hint address checks
Date: Tue, 27 Aug 2024 16:07:05 +0800
X-OQ-MSGID: <20240827080707.3788836-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <tencent_108260B43689E30AAE5D0C7C085AA31ADF06@qq.com>
References: <tencent_108260B43689E30AAE5D0C7C085AA31ADF06@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charlie Jenkins <charlie@rivosinc.com>

The mmap behavior that restricts the addresses returned by mmap caused
unexpected behavior, so get rid of the test cases that check that
behavior.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 73d05262a2ca ("selftests: riscv: Generalize mm selftests")
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 .../selftests/riscv/mm/mmap_bottomup.c        |  2 -
 .../testing/selftests/riscv/mm/mmap_default.c |  2 -
 tools/testing/selftests/riscv/mm/mmap_test.h  | 67 -------------------
 3 files changed, 71 deletions(-)

diff --git a/tools/testing/selftests/riscv/mm/mmap_bottomup.c b/tools/testing/selftests/riscv/mm/mmap_bottomup.c
index 7f7d3eb8b9c9..f9ccae50349b 100644
--- a/tools/testing/selftests/riscv/mm/mmap_bottomup.c
+++ b/tools/testing/selftests/riscv/mm/mmap_bottomup.c
@@ -7,8 +7,6 @@
 TEST(infinite_rlimit)
 {
 	EXPECT_EQ(BOTTOM_UP, memory_layout());
-
-	TEST_MMAPS;
 }
 
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/riscv/mm/mmap_default.c b/tools/testing/selftests/riscv/mm/mmap_default.c
index 2ba3ec990006..3f53b6ecc326 100644
--- a/tools/testing/selftests/riscv/mm/mmap_default.c
+++ b/tools/testing/selftests/riscv/mm/mmap_default.c
@@ -7,8 +7,6 @@
 TEST(default_rlimit)
 {
 	EXPECT_EQ(TOP_DOWN, memory_layout());
-
-	TEST_MMAPS;
 }
 
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/riscv/mm/mmap_test.h b/tools/testing/selftests/riscv/mm/mmap_test.h
index 3b29ca3bb3d4..75918d15919f 100644
--- a/tools/testing/selftests/riscv/mm/mmap_test.h
+++ b/tools/testing/selftests/riscv/mm/mmap_test.h
@@ -10,76 +10,9 @@
 #define TOP_DOWN 0
 #define BOTTOM_UP 1
 
-#if __riscv_xlen == 64
-uint64_t random_addresses[] = {
-	0x19764f0d73b3a9f0, 0x016049584cecef59, 0x3580bdd3562f4acd,
-	0x1164219f20b17da0, 0x07d97fcb40ff2373, 0x76ec528921272ee7,
-	0x4dd48c38a3de3f70, 0x2e11415055f6997d, 0x14b43334ac476c02,
-	0x375a60795aff19f6, 0x47f3051725b8ee1a, 0x4e697cf240494a9f,
-	0x456b59b5c2f9e9d1, 0x101724379d63cb96, 0x7fe9ad31619528c1,
-	0x2f417247c495c2ea, 0x329a5a5b82943a5e, 0x06d7a9d6adcd3827,
-	0x327b0b9ee37f62d5, 0x17c7b1851dfd9b76, 0x006ebb6456ec2cd9,
-	0x00836cd14146a134, 0x00e5c4dcde7126db, 0x004c29feadf75753,
-	0x00d8b20149ed930c, 0x00d71574c269387a, 0x0006ebe4a82acb7a,
-	0x0016135df51f471b, 0x00758bdb55455160, 0x00d0bdd949b13b32,
-	0x00ecea01e7c5f54b, 0x00e37b071b9948b1, 0x0011fdd00ff57ab3,
-	0x00e407294b52f5ea, 0x00567748c200ed20, 0x000d073084651046,
-	0x00ac896f4365463c, 0x00eb0d49a0b26216, 0x0066a2564a982a31,
-	0x002e0d20237784ae, 0x0000554ff8a77a76, 0x00006ce07a54c012,
-	0x000009570516d799, 0x00000954ca15b84d, 0x0000684f0d453379,
-	0x00002ae5816302b5, 0x0000042403fb54bf, 0x00004bad7392bf30,
-	0x00003e73bfa4b5e3, 0x00005442c29978e0, 0x00002803f11286b6,
-	0x000073875d745fc6, 0x00007cede9cb8240, 0x000027df84cc6a4f,
-	0x00006d7e0e74242a, 0x00004afd0b836e02, 0x000047d0e837cd82,
-	0x00003b42405efeda, 0x00001531bafa4c95, 0x00007172cae34ac4,
-};
-#else
-uint32_t random_addresses[] = {
-	0x8dc302e0, 0x929ab1e0, 0xb47683ba, 0xea519c73, 0xa19f1c90, 0xc49ba213,
-	0x8f57c625, 0xadfe5137, 0x874d4d95, 0xaa20f09d, 0xcf21ebfc, 0xda7737f1,
-	0xcedf392a, 0x83026c14, 0xccedca52, 0xc6ccf826, 0xe0cd9415, 0x997472ca,
-	0xa21a44c1, 0xe82196f5, 0xa23fd66b, 0xc28d5590, 0xd009cdce, 0xcf0be646,
-	0x8fc8c7ff, 0xe2a85984, 0xa3d3236b, 0x89a0619d, 0xc03db924, 0xb5d4cc1b,
-	0xb96ee04c, 0xd191da48, 0xb432a000, 0xaa2bebbc, 0xa2fcb289, 0xb0cca89b,
-	0xb0c18d6a, 0x88f58deb, 0xa4d42d1c, 0xe4d74e86, 0x99902b09, 0x8f786d31,
-	0xbec5e381, 0x9a727e65, 0xa9a65040, 0xa880d789, 0x8f1b335e, 0xfc821c1e,
-	0x97e34be4, 0xbbef84ed, 0xf447d197, 0xfd7ceee2, 0xe632348d, 0xee4590f4,
-	0x958992a5, 0xd57e05d6, 0xfd240970, 0xc5b0dcff, 0xd96da2c2, 0xa7ae041d,
-};
-#endif
-
-// Only works on 64 bit
-#if __riscv_xlen == 64
 #define PROT (PROT_READ | PROT_WRITE)
 #define FLAGS (MAP_PRIVATE | MAP_ANONYMOUS)
 
-/* mmap must return a value that doesn't use more bits than the hint address. */
-static inline unsigned long get_max_value(unsigned long input)
-{
-	unsigned long max_bit = (1UL << (((sizeof(unsigned long) * 8) - 1 -
-					  __builtin_clzl(input))));
-
-	return max_bit + (max_bit - 1);
-}
-
-#define TEST_MMAPS                                                            \
-	({                                                                    \
-		void *mmap_addr;                                              \
-		for (int i = 0; i < ARRAY_SIZE(random_addresses); i++) {      \
-			mmap_addr = mmap((void *)random_addresses[i],         \
-					 5 * sizeof(int), PROT, FLAGS, 0, 0); \
-			EXPECT_NE(MAP_FAILED, mmap_addr);                     \
-			EXPECT_GE((void *)get_max_value(random_addresses[i]), \
-				  mmap_addr);                                 \
-			mmap_addr = mmap((void *)random_addresses[i],         \
-					 5 * sizeof(int), PROT, FLAGS, 0, 0); \
-			EXPECT_NE(MAP_FAILED, mmap_addr);                     \
-			EXPECT_GE((void *)get_max_value(random_addresses[i]), \
-				  mmap_addr);                                 \
-		}                                                             \
-	})
-#endif /* __riscv_xlen == 64 */
-
 static inline int memory_layout(void)
 {
 	void *value1 = mmap(NULL, sizeof(int), PROT, FLAGS, 0, 0);
-- 
2.45.2


