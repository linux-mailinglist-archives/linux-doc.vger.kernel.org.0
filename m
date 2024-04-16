Return-Path: <linux-doc+bounces-14263-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 844108A6214
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 06:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4045828565D
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 04:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05D12D627;
	Tue, 16 Apr 2024 04:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dproWZwV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C622E403
	for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 04:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240727; cv=none; b=fSc4Qcvv2n7fv9xO1+FNNo2qqQ17su2z+HMhzT+7MN+FbEF6oGwXQzqsHt2zF7gkj2BMHFoZaWXxOvjHIx1RgTIw9qz1C7l8qzSq4oAtJTVx5wlgMJvS+i8C58+ZIY9+jhAA3frczJzHn2NsBC2NNINqG328QAUhM+mF1S3ku/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240727; c=relaxed/simple;
	bh=LQrrqBv9wvdBWycpaHPL+H3slFz3ptTYlzHL6vN3eX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhzaDezvQK9wVV6wlgv4ye3TEGFc0WLCZDSfdUv5CppBsxWOLmM60CqtNQVTULICfg0sH7G0Pt7nkaZp+QwdMWlbTdpdn0bsvXENwKiJf66baIkq4Cp8IGNhzCDL+PeGnxaBXzJO/pFZ12i1fNuYFoq6d3W4NMx/b+ufHpNEVHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dproWZwV; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5aa27dba8a1so2466635eaf.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 21:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240724; x=1713845524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ix+javIgp733xv2R/th8q6ndEXpLyg6dF47BfihNDR4=;
        b=dproWZwVtPArVzw1RrZRRZti/sBjAMjDplrcBCypuqBYSRmK/D4KW1dxs6ZB66GHyD
         GIKYJQCzR0xx2j4qxV5fj2AReprPu3ueBMG9MRBjOjZnctLaV9uf+/PIjsohdb2oVo5h
         O88ha4lGw9JByqFGaUCAxb9Mua6ARym2rikLMnwzIn8TmlMdzF6f4/pd5qc6el9fgq1T
         MOoJg+z42bIfOlSrYeG2I85Y/1cq0M9Sp3mhxl+lQM5wvX+RDUPlzc3iCZDfkVzcKmg5
         5NGkyhqVZxiM4Hjih8AjpsVSfz7jm61HsSCdjo9uQDdpZljuz9/V35/1nPGw8FIe24Ln
         hbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240724; x=1713845524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ix+javIgp733xv2R/th8q6ndEXpLyg6dF47BfihNDR4=;
        b=i61ki0ZK4ObFSOTyL15cQ6B9jeNuuhxFsl25+sDgsAGndctetbCedPrqu4k9foeMVH
         AYlfg7yWVzRoajUjOKlRHf2lCjPqPWBcuwp1v+Lo77rqcR4Tb3yCTbkIW2E+ukti1BfR
         PDT5woTw1WlaJwpPfzwr4qqYgPLsP7FCZfXMBZxH9YxqGfxicBI0tSUIzR/K/mKGlodf
         2ZLC2C3Tlw5gVhR/Ot8a6oBtamYBf6nnJRjRD0ZMPxwEPSWJBzg8iFzg4gzXFNkxEL/s
         wNWP2sTXaCBxSzeFwfM4rHRxvQkTyUsfaV5p0L+wh45Wo8417d+MR2DX5Yn9jWbstA4i
         d+MA==
X-Forwarded-Encrypted: i=1; AJvYcCV2EkYCsX+V1js9+CDEdnHPfHSm5tczW+URu3SaUYCsADQq1JUJmxZ2J/rP/gzqRnZ8DCpY7ahCMesuC4VWDJsLxGekIqBG16QO
X-Gm-Message-State: AOJu0YzG25QuNJBgob2gD3cZPRcTbhA5AAlr44rZpJE7bo03IJMWS432
	71vwOFyZNC5d92CNeMto1DAs9+sx8mawxy6iWpJau0Aac5CHR3TXzB1uDpDhQ+w=
X-Google-Smtp-Source: AGHT+IGbXDdvkRXDVqIhB5dqemFYTdy2m0goN60loDY2Leve+0R5Bqf0uSbuOhPnRHK/s9fJTR1bFg==
X-Received: by 2002:a05:6870:1584:b0:22e:912f:252b with SMTP id j4-20020a056870158400b0022e912f252bmr15110674oab.2.1713240724489;
        Mon, 15 Apr 2024 21:12:04 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:03 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:11:59 -0700
Subject: [PATCH v2 02/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=1713;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=LQrrqBv9wvdBWycpaHPL+H3slFz3ptTYlzHL6vN3eX8=;
 b=pEvFaJ5tW8BRTsoIuU0vqAG3GqiyA34hephuzDd9Vt/mEXWI8V3M05nZxnw3RjeGomtNhqbaB
 ebM2WLKfKRbCojcWa3e7jXDiV067vSqaTtljUUTJYSibWxbVYFA+rxO
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d3
35e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..99d2a9e8c52d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -477,6 +477,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -484,5 +488,11 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
 additionalProperties: true
 ...

-- 
2.44.0


