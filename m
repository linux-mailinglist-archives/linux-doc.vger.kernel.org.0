Return-Path: <linux-doc+bounces-13733-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0819289E1D9
	for <lists+linux-doc@lfdr.de>; Tue,  9 Apr 2024 19:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8081F237E9
	for <lists+linux-doc@lfdr.de>; Tue,  9 Apr 2024 17:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDA1156973;
	Tue,  9 Apr 2024 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iZ6RqVLR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C93156868
	for <linux-doc@vger.kernel.org>; Tue,  9 Apr 2024 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712685074; cv=none; b=GHDRynp1WTRzCHsZlShQAaNnEa5nfWF4iwgzaz+C03Y6TBB1PyRQGJPf3hlIyQFveYTYqclXvLHXUnGx2Tb63PZLO+hj/Tverewqs4tyQEpCiJeyDbDnruhGZdTYxSI4NHFDW2MRVB7XGonnHmleCzoBkx274R9/hEybycbR+pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712685074; c=relaxed/simple;
	bh=s2tc144aBgNbfS3s/tihGdBDGVdjaSbfQ+SMtFuveA0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p1SyUohIsEh7EYt4yEvNtLpgJfuDZpMn2bxsDRvGuO2kUNXXSM9N0pjyVIoXXLmfQpBlxeP7tsNjp89zNvLzxNGFxxGrgqoNeIKjf0Ee3uS4o4zZY4aNo2OXzeSflQPutr0kOGA6WBKGr1pzmsa8C33bbcjZTUs2iWH+0Gy33tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iZ6RqVLR; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61561dbdf14so77625187b3.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Apr 2024 10:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712685072; x=1713289872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vL198wTn+Uk37UUg6mX+X5B2xDFF41dQr7U2AoMPZ0=;
        b=iZ6RqVLR8jrY5bVAUNJRGENQq2blNMurn4IYjP67hksPv3HrFsQ75oZ3tHBUorGCwS
         2CxkLbEfy1iEgqpXcMbC2J+f4Rj58jweu0OvAljFu29ig2Yry2oi3pipyqWqip3bB0sL
         2xyXKAvcPNnjAwaWf254RKGECXXg2xWFgceKA7eqOAgmdLiNBrbJ/HeLjbHc6I/jq02n
         owK87ZZ2KPD4DoBljFPtmspGt39bAmf7ZR/Ka+p1oJsTF/SrN4kgVFm6Kd822Fb3RyUS
         UHBRX0pJb8k2ra5JZWqgbOANyf8izTBwsaJUXtCKA56d7BP4E8xMClr68GaCWpo4sLol
         m8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712685072; x=1713289872;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/vL198wTn+Uk37UUg6mX+X5B2xDFF41dQr7U2AoMPZ0=;
        b=VMdoz5o7etmJh8blAYvjPh4WhFDixodMZ5nU/E9ki89ioVGPHuLUsbHblffo6fjPk5
         4d6Z9yh6PAyvrzU7AzxGgrfvz2VNbRCiueoOpIgoUmld9wkdREhZPvGRqGJKUVa1PQPG
         fSu6gh0OyiX2ONNxmNDpqRF5fqufwyu78W7AkX7Q66t4L2JOE/PQ333WrZwldAdIUdmG
         GYd6K38LoTeYFGjjUWIbXdjB7P8uA/mB0FrQpqk2/iP4XMGR9s43bCWO0gR2XC2j29fC
         +mt63IZm+ppDoxR3Go3RI1UsADE3Ez2Y8o+xAK+PzJxRm0H/sF8eiSlYaVUWRk2jPQtJ
         6IBA==
X-Gm-Message-State: AOJu0Yx3L3UyRunUc62ZR4AKDC89mMm1cxvCdJ8jg16UqVwQoLdg5kpk
	Hqb1omvaMY5+0NZNv68leZQWXSqYHxwjxPa91GCLBVM2edTpcXc36nM5vhrRytl5yesxZyiffZ9
	64w==
X-Google-Smtp-Source: AGHT+IHACX2l7YRowPE7LBYQgfxO9IwPoJAvZuIh2hi8AYJti5CEda5NxgViN/ORL+KHH0LXS6bpmGpI3cA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:a002:0:b0:614:2a7d:5ad3 with SMTP id
 x2-20020a81a002000000b006142a7d5ad3mr819172ywg.0.1712685072337; Tue, 09 Apr
 2024 10:51:12 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  9 Apr 2024 10:51:05 -0700
In-Reply-To: <20240409175108.1512861-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240409175108.1512861-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240409175108.1512861-2-seanjc@google.com>
Subject: [PATCH 1/3] x86/cpu: Actually turn off mitigations by default for SPECULATION_MITIGATIONS=n
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Daniel Sneddon <daniel.sneddon@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Initialize cpu_mitigations to CPU_MITIGATIONS_OFF if the kernel is built
with CONFIG_SPECULATION_MITIGATIONS=3Dn, as the help text quite clearly
states that disabling SPECULATION_MITIGATIONS is supposed to turn off all
mitigations by default.

  =E2=94=82 If you say N, all mitigations will be disabled. You really
  =E2=94=82 should know what you are doing to say so.

As is, the kernel still defaults to CPU_MITIGATIONS_AUTO, which results in
some mitigations being enabled in spite of SPECULATION_MITIGATIONS=3Dn.

Fixes: f43b9876e857 ("x86/retbleed: Add fine grained Kconfig knobs")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 8f6affd051f7..07ad53b7f119 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -3207,7 +3207,8 @@ enum cpu_mitigations {
 };
=20
 static enum cpu_mitigations cpu_mitigations __ro_after_init =3D
-	CPU_MITIGATIONS_AUTO;
+	IS_ENABLED(CONFIG_SPECULATION_MITIGATIONS) ? CPU_MITIGATIONS_AUTO :
+						     CPU_MITIGATIONS_OFF;
=20
 static int __init mitigations_parse_cmdline(char *arg)
 {
--=20
2.44.0.478.gd926399ef9-goog


