Return-Path: <linux-doc+bounces-7781-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB77841799
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jan 2024 01:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D4921C22BA6
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jan 2024 00:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1026F3612D;
	Tue, 30 Jan 2024 00:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="RRpvLjEp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086471E893
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 00:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706575027; cv=none; b=Os0CvxaOyMDqkbdGqNn0kZ/1MFNmKZfWd7Y1JwBojQnnEdAWNG3gPbTiy2bQ1g7hEtD2k0yjHfZK651FATAxMNasRpY3OaFKwdHVHLiN52MVbe44XXujDfrmJgldyf1iaXIqj71kcsQ5E1Y3QJtipVjG5SbCSdrMUWQ2j6IxClk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706575027; c=relaxed/simple;
	bh=V7pluBm2W1PoZ2bBLrm+qZq65mTPWf8JJaZyD0Mij4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cXP/fz2Q3ByelI5fk+18L+eLPDpytpUPhZztFvS3KsrZ7oMAq6PRbx7lOURtKwe66uWfDvdHnYIjIIims49Aa3wxjcqMfHpm7XrRtz5KwA7aHNedcWrwHfuPi1N86fidG2S1f8Tud78W8ZkVsa1lldraS6xmXYkOR44ekQzooMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=RRpvLjEp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d8f3966982so6801985ad.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Jan 2024 16:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706575024; x=1707179824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBdnavPhPLG4hLHe/lbowMi09bgXqSC/rhZZs2QP0QQ=;
        b=RRpvLjEptK8zaBoSTwxNrwOJw0rckFpO9NnGxTv/V+Z789HbnSV1cA29ScFRZlqHjT
         WOGjbaem1pO8ipYyuI4hyZTDzLovGeM7oIEQhexGbj6CwPS6r7fZgRuDKOiFv2LednQs
         I+Sz0HyK5ycdbZYqKT4Z396iokw6StEfHlaY0e81gMooh3nuH9xgiizCDxpSpKcMTahZ
         WTbYy34Ny9E2m7/TIlVmZMll0BpNNEJf4S6sJnYrTX1Gjs/V5jwg/1n97/sGkLOA7q5F
         nBU5J9ZukJU7UjNoFItmpT49JMxHv7uaAPh7TIhxhtCS7sFHlM24F8fIOfPJW4T5jdH/
         NH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706575024; x=1707179824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBdnavPhPLG4hLHe/lbowMi09bgXqSC/rhZZs2QP0QQ=;
        b=qEYEwCSaxeRySOSCVwfBii1bbXB1+rPhABH7L5UJ3vIfGPpUVKjK37c4/lN0SxEKdt
         0REF3yWaQybyMk2pfiGuK39PEj2g8KVU5VHYgmVkhPdnqHHBPMa34qgnlOo5+8PC9buD
         EyXLdLDIpXvEI5vn9X3Uh5X2epeAlrIHURjPAVy4lvmbach3qH4g/uYjYl0NOmt5PcN8
         wAtgwLwxwY0myUvyB1n1DUhqIUmZEovHfqKdhjUvkxEGdV+uRbKNwj8RmTTUggSoFDxR
         rt8iH9CSLl+fUXCPg1DJOGSNKiaC3qNZHOI4Tsll1G2X0+BeZck8XrGj+7E7mv9e541C
         eT0A==
X-Gm-Message-State: AOJu0YxaGj5pw9D5ntxcFKhkfJB/ZDia1FX3LANkcQ2p4jqmf5RVHGnw
	KnqH9TZkGaneS6uQSwhMi8px5+ItaCux/X4xQ9octPlaehuxrGr0YAZYALm7SKY=
X-Google-Smtp-Source: AGHT+IGUsknhl2CDcef7BUE1BsiJx3EyQBp1F7tMWLKnMckNrmrOa3LA4FFwrTaqlOeS/OBEkFdUbA==
X-Received: by 2002:a17:902:f551:b0:1d8:f21b:809c with SMTP id h17-20020a170902f55100b001d8f21b809cmr2649429plf.60.1706575024448;
        Mon, 29 Jan 2024 16:37:04 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id jb9-20020a170903258900b001d8ca3f5e3fsm3406375plb.295.2024.01.29.16.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 16:37:04 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 29 Jan 2024 16:37:00 -0800
Subject: [PATCH 1/3] riscv: mm: Use hint address in mmap if available
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-use_mmap_hint_address-v1-1-4c74da813ba1@rivosinc.com>
References: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
In-Reply-To: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706575021; l=2676;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=V7pluBm2W1PoZ2bBLrm+qZq65mTPWf8JJaZyD0Mij4k=;
 b=xLofBRKvo5qnvg1/QxrS9M++r6DfPgaAnZCvKPa1IRqMAJzNlfAUw3QxPPg3xgb0XIbJE85Ak
 oCl/l13iT1iCv7LIAifwyK+c286DNL3c3U9kefDRkWMehYKkGUTw++4
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

On riscv it is guaranteed that the address returned by mmap is less than
the hint address. Allow mmap to return an address all the way up to
addr, if provided, rather than just up to the lower address space.

This provides a performance benefit as well, allowing mmap to exit after
checking that the address is in range rather than searching for a valid
address.

It is possible to provide an address that uses at most the same number
of bits, however it is significantly more computationally expensive to
provide that number rather than setting the max to be the hint address.
There is the instruction clz/clzw in Zbb that returns the highest set bit
which could be used to performantly implement this, but it would still
be slower than the current implementation. At worst case, half of the
address would not be able to be allocated when a hint address is
provided.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/processor.h | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda54..f3ea5166e3b2 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -22,14 +22,11 @@
 ({								\
 	unsigned long mmap_end;					\
 	typeof(addr) _addr = (addr);				\
-	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
-		mmap_end = STACK_TOP_MAX;			\
-	else if ((_addr) >= VA_USER_SV57)			\
-		mmap_end = STACK_TOP_MAX;			\
-	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
-		mmap_end = VA_USER_SV48;			\
+	if ((_addr) == 0 ||					\
+		(IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
+		((_addr + len) > BIT(VA_BITS - 1)))		\
 	else							\
-		mmap_end = VA_USER_SV39;			\
+		mmap_end = (_addr + len);			\
 	mmap_end;						\
 })
 
@@ -39,14 +36,12 @@
 	typeof(addr) _addr = (addr);				\
 	typeof(base) _base = (base);				\
 	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
-	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
+	if ((_addr) == 0 ||					\
+	    (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
+	    ((_addr + len) > BIT(VA_BITS - 1)))			\
 		mmap_base = (_base);				\
-	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
-		mmap_base = VA_USER_SV57 - rnd_gap;		\
-	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
-		mmap_base = VA_USER_SV48 - rnd_gap;		\
 	else							\
-		mmap_base = VA_USER_SV39 - rnd_gap;		\
+		mmap_base = (_addr + len) - rnd_gap;		\
 	mmap_base;						\
 })
 

-- 
2.43.0


