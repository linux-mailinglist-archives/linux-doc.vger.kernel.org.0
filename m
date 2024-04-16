Return-Path: <linux-doc+bounces-14266-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A518A621E
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 06:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8815B235A8
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 04:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8583D549;
	Tue, 16 Apr 2024 04:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="KSolLaZD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8263BBEA
	for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 04:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240731; cv=none; b=t84d4aWL6vgw0CFdvWQ0i2wlnxQr27RXq4wOab+uSDrYcUhi0lZckkHjHWmR4Dc4JhjF6CndDkU0AB8Cx4cpnuvoiB5gvngvwt19jnbWvCHYY1cC9e+ErzbtemhEFVdYefGVDeZda7qD90t/N42IbaSH0ajyvHsEgg3TboWwRlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240731; c=relaxed/simple;
	bh=m0plhmdNbdmA80gesn/7KnCdXtvm5F7fdW9kC5KptxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTT5mTULq5qZO3wVZX1JaW/BnzGpfsZpl9YvZJD4QBKO445WvOlJY/1afa0tZLEv9qWu27BV0vl7Xfqkf9W/HXs0x4swMi+jnll7ZSG9harpkQAkL/5M1Tll3Fs+xHqA0TKCchnJwBO94ODBCQrvE52Bk4y7uqfPzwSTbks5jwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=KSolLaZD; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5aa318db8a0so2632793eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 21:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240729; x=1713845529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVSzHGFLNnrGti654VC11tvpK1bZGKmyJ0hbbIeQ45Q=;
        b=KSolLaZDORvmHMAd9QWBGgfyAEJoKPd8rzVkjMVt3vWlaJyoEMK5eTCfTK81uuyEEE
         OXdj1MyObjVj6eA7rXk+YbDXrVRiWXKFkhH9tFZ7o8vM4tYCuQakflIP9L42xHqOIdF0
         5cC5YWotZyBGWxSHqETdYDYTMbRt7y/MW84l2t0yz5TuOqXajtMXQ3DN40UqZyQNqBEm
         r2zd59hRDoEa5PakAihLudgBm1j0eBgK0B+V7nI5pcNx0qrgV0HJI2nwREWqq3p/0HO6
         QMM3PAacIcXKCj1T1zv2UaaDIpjZv/Lbq5W8DAeCRE58nfuBZmtignBPKpRfvLBSaZqW
         +uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240729; x=1713845529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVSzHGFLNnrGti654VC11tvpK1bZGKmyJ0hbbIeQ45Q=;
        b=M59T87HoPzfmjecA/yy/Ccjg908FWiTREY0Rft+KivRIb8QA6wPQVo6+8x6Ay82rUZ
         H8ZGeHcGM9qFjobvfZUdT2ded2ZJ+mh/y95URDmxzoKKwvfWd1QnMvafr1iF8uaVRN4h
         g1VrBmo6Qw5jTba0SwtkRJGw9hiKFQ4zpeZcqhWivTsCIZszGsFQSpyD4DCgQY6C2D7Y
         NN0UdcpQ+SSz1M8B5/SLykvMkZjQ6bsJlQXMH0JTAdsoMz0ZHvozdsvhcymSyG3S1zLt
         qfO5IPtLn4rSrbPdNV0zyMM2/uoqkyZ257APiTyEO7N/L0HwVdJt51efrTYe94zVtap5
         HxQA==
X-Forwarded-Encrypted: i=1; AJvYcCWfv60p35QTNUiPUhHCGT/dKWRSWhYcD9YMojhDrTeTBSqKh3SoKF4tOsKFPQGHLhxkcFfCoKI+0I8oe7ISqAG7r10zUmLvEYl5
X-Gm-Message-State: AOJu0YzEtWSfOG1la/kXCZGRFERMz/HxtfmoKHDAV0egzOVKpEzMidYx
	4MmjGlsSV8QlGdfeJT1Z2NOHaEaAKD1pHti5hNwhNw1Nl8DFUZ3YqXUR2VQW9lk=
X-Google-Smtp-Source: AGHT+IFZkd9NDeZNRCG3hOkxXiBzQioQ5hVlHYi/wzn2zrou30bpeRqjwOjjzziMFEa1WsZ5xhufcQ==
X-Received: by 2002:a05:6870:315:b0:22e:8539:60a0 with SMTP id m21-20020a056870031500b0022e853960a0mr12983308oaf.46.1713240729449;
        Mon, 15 Apr 2024 21:12:09 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:08 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:02 -0700
Subject: [PATCH v2 05/17] riscv: Fix extension subset checking
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-5-c7d68c603268@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=1065;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=m0plhmdNbdmA80gesn/7KnCdXtvm5F7fdW9kC5KptxM=;
 b=7DRonXaAgLJzhWvXE1qbRYS0I+BfU0oGsBOBG0My2i8BWoHww2ZulgK6Ne5SIPj9jjmGT1fAh
 WB/f+iRxM2uC9jcfHku9va0/Bg5wWaTVh/Ak3KRIWgDEL+7zSph3JfU
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
than if ext->subset_ext_ids[i] is valid, before setting the extension
id ext->subset_ext_ids[j] in isainfo->isa.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c6e27b45e192..6dff7bb1db3f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -607,7 +607,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 
 			if (ext->subset_ext_size) {
 				for (int j = 0; j < ext->subset_ext_size; j++) {
-					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
+					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
 						set_bit(ext->subset_ext_ids[j], isainfo->isa);
 				}
 			}

-- 
2.44.0


