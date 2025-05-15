Return-Path: <linux-doc+bounces-46223-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F94DAB8163
	for <lists+linux-doc@lfdr.de>; Thu, 15 May 2025 10:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF3F83A1FF6
	for <lists+linux-doc@lfdr.de>; Thu, 15 May 2025 08:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5590228B3F9;
	Thu, 15 May 2025 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="I+o+mqOr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC342882CE
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747298920; cv=none; b=od421m3rWdm+fWVI3yAsQYBLY8igAYoFRTBDKkC7ivV1JGcYMwpNKZsWtlqqqitool08oURhiVcDyW8BaNH5B0jZsljUZPMk8+i8qzUJcwPArIM5/n1rLCG8xl2ctwR54ArtUXJHatMykCkCd077l99zsYIWw0z/tcN5SgZWwUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747298920; c=relaxed/simple;
	bh=uafTKsLt5Y6vI+2YJVWbCoVLU1+w6d1TN41/6GcJe8w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=PuqnDwql+kJs77QHgkm/I+tsLUSclujk9gGX+Q3Y5i4Xdt5c51TX0KISpjslwQb42VQVLOTLGXBiAZrnVhV58W2iuywhyfUCY05nJNsxwZXIaRtFfVahm/zkaB1aswUbsemRIG/OQ3iSFngDmzJD2j0cVW9ihZywo3dIj4vRIPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=I+o+mqOr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442ea0b3a9fso283615e9.3
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 01:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747298916; x=1747903716; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdVLI+IKJQCwIaBP/4ipGt86DAIuj3sOKMK9lc4aqFc=;
        b=I+o+mqOrLwb6wAy3fZ6S3zjKPSqaM3CwDCRIeUdIay3/UdKVnn2nqClHp2i280eIJo
         tZyO0jy8xMq7nzDk/AqEDzGLQA6Av8h5IUIrV+E9571R5E2Zid8XpZXo6RayFQu3J9Et
         F/GBqCB1+3SvxUlFk0JZ8KNMo3Pt8iiTg8MJGPAZ2Y7gQJZL9F5OGqKptUTpV1kwK24L
         EOlzSCCEVIi2oevOVj9yLa8GrSIWcCDBU4NLrVldY0U3XkdWSWI2ytaUJ8Sq3ZQqb4cs
         u1f0G8OtL1VTWuMsykX7Bwk74nyGnyworNNU6w3awX+4DK4SlJeRIYuANTsjnT//Pq4q
         lnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747298916; x=1747903716;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bdVLI+IKJQCwIaBP/4ipGt86DAIuj3sOKMK9lc4aqFc=;
        b=slxFLnFnT8w1GrXsA8vhO4rYD7MXda+J53eF/+/aVHG5Bhm3z/Yk24IDPrZPwjkaT8
         3QQPQ/C4Bcbft6/1Rmf5dsItDoZId9TYykX/c39drqOST3UT8wPRywYMV22vSxQksxkX
         RPJY+dWi99/X7/sxJ3cqtij8fb8riNPU7EJvMYr9CjDd72tePfNzWu8hYIVf6KDDrDCj
         v2kJpT6t/2Ozt87GFh6+e7PT1vCNEv5frfnUu/NLkUQR1adkcidWYA/GoSdw9VymndSt
         +aV0NWqTaWXXkpzkUcufr5oDLPAHTb16Nmwk5AR3rq8+/reb3+CsEXZwxFSKwwcNicrE
         KXvQ==
X-Forwarded-Encrypted: i=1; AJvYcCViwlKz6gqCikuh4qMHxKboh5pdcI/RSBtnGv7NYQov/hm/k+YKPSBqk2TGcGJI9uvQqsIYJRada3M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1r2hKiCzAHVZbMKGaLtKmdRCYYlVahM4PxNgTeR2hqtousjO/
	wTySH9bPuQyQd2IvtHn7qc4wUGik7ythv+7U93LZZ7DsjSANtG5woN2oI53a9Hg=
X-Gm-Gg: ASbGncvurTu+GtpWXVaVfD7lcawGK40FPTa+V+jq5iSyq9G77NhsisLOHIaEPSFNV8f
	qr1AxhTsWTzJjKWrrZWlbpd2rSGZtb8Zyi3Z/Bf/rcefVrsPFcp/y1HLw6AQoGf2gSDMTFRUrpg
	dTX0fTj14L3mhYNuPkYfHCtIIWlBFWOzo9Z2QPBbbiqlDqTEDtIw5dlZGMscHgHjr09bMUT5paL
	Wi+R0gNyaub/z+JDdPwQ8AXSeg8PD1sXHn5KU7r8JUz6tETuxWjOjFS2pS9dztiyC73prz1G4hA
	KBTEAqn8So7fAC9z/tRoeZOzaokxt/iIh7HM+wreuuOPI8n+7QwjNL1g87U/ypopSHmaR36Ejax
	FPDGBcce2Epw=
X-Google-Smtp-Source: AGHT+IFl5ofT8H2ymocVMBID7uffI6yQBoHWwntFgE3AOdsNMnKtMdzBwHwHlEbKzThnIcYnf09dKg==
X-Received: by 2002:a5d:4311:0:b0:3a3:55b4:1abb with SMTP id ffacd0b85a97d-3a355b41b8emr294033f8f.12.1747298916300;
        Thu, 15 May 2025 01:48:36 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf2bsm21822557f8f.80.2025.05.15.01.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 May 2025 10:48:35 +0200
Message-Id: <D9WLRSAB63M5.3DZD4ND3WVZ6F@ventanamicro.com>
Subject: Re: [PATCH v15 05/27] riscv: usercfi state for task and
 save/restore of CSR_SSP on trap entry/exit
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>,
 <rust-for-linux@vger.kernel.org>, "Zong Li" <zong.li@sifive.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Alexandre Ghiti" <alex@ghiti.fr>, "Deepak Gupta" <debug@rivosinc.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Conor Dooley" <conor@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Eric Biederman" <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann
 Horn" <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
 <20250502-v5_user_cfi_series-v15-5-914966471885@rivosinc.com>
 <D9OZVNOGLU4T.2XOUPX27HN0W8@ventanamicro.com>
 <122fc6cd-2e21-4fca-979d-bcf558107b81@ghiti.fr>
In-Reply-To: <122fc6cd-2e21-4fca-979d-bcf558107b81@ghiti.fr>

2025-05-15T09:28:25+02:00, Alexandre Ghiti <alex@ghiti.fr>:
> On 06/05/2025 12:10, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
>> 2025-05-02T16:30:36-07:00, Deepak Gupta <debug@rivosinc.com>:
>>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>>> @@ -91,6 +91,32 @@
>>> +.macro restore_userssp tmp
>>> +	ALTERNATIVE("nops(2)",
>>> +		__stringify(				\
>>> +		REG_L \tmp, TASK_TI_USER_SSP(tp);	\
>>> +		csrw CSR_SSP, \tmp),
>>> +		0,
>>> +		RISCV_ISA_EXT_ZICFISS,
>>> +		CONFIG_RISCV_USER_CFI)
>>> +.endm
>> Do we need to emit the nops when CONFIG_RISCV_USER_CFI isn't selected?
>>
>> (Why not put #ifdef CONFIG_RISCV_USER_CFI around the ALTERNATIVES?)
>
> The alternatives are used to create a generic kernel that contains the=20
> code for a large number of extensions and only enable it at runtime=20
> depending on the platform capabilities. This way distros can ship a=20
> single kernel that works on all platforms.

Yup, and if a kernel is compiled without CONFIG_RISCV_USER_CFI, the nops
will only enlarge the binary and potentially slow down execution.
In other words, why we don't do something like this

 (!CONFIG_RISCV_USER_CFI ? "" :
   (RISCV_ISA_EXT_ZICFISS ? __stringify(...) : "nops(x)"))

instead of the current

 (CONFIG_RISCV_USER_CFI &&
    RISCV_ISA_EXT_ZICFISS ? __stringify(...) : "nops(x)")

It could be a new preprocessor macro in case we wanted to make it nice,
but it's probably not a common case, so an ifdef could work as well.

Do we just generally not care about such minor optimizations?

(If we wanted to go an extra mile, we could also keep the nops when both
 CONFIG_RISCV_USER_CFI and RISCV_ISA_EXT_ZICFISS are present, but
 command line riscv_nousercfi disabled backward cfi.)

Thanks.

