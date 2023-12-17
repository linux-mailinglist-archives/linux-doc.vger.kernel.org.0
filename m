Return-Path: <linux-doc+bounces-5401-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF48815D2E
	for <lists+linux-doc@lfdr.de>; Sun, 17 Dec 2023 03:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F8911F22514
	for <lists+linux-doc@lfdr.de>; Sun, 17 Dec 2023 02:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0571102;
	Sun, 17 Dec 2023 02:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJFpDkED"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD13A47
	for <linux-doc@vger.kernel.org>; Sun, 17 Dec 2023 02:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-591553d3835so1446844eaf.3
        for <linux-doc@vger.kernel.org>; Sat, 16 Dec 2023 18:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702779495; x=1703384295; darn=vger.kernel.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=OFl8kjpw91XelbaLp/NqZrQDKjPZSUtARdmSUPQXSX8=;
        b=VJFpDkEDGw/FR4o/St1bqanokQFV99ffBLRVEy4vwSZWwLafnkkXJAuTJnKac2oPV2
         OXBcr2dAu0hwlqf2wxz5aLt3UFQIep2NFn1wCmTuxnCtmodjGz/zDewvgsiU4iSXfixU
         5IVxUaZkOy7gQjYAuxwvMylvIqJJfZYzVtxdZI36NRheHiX2AnPmkUYB3odKBak+ULjN
         fTdaFgbyOwmFglxoXQ1Zg669yAOCvBj1QUubpLI6NCTEHawkbq6uL9HvFYiM634LjBnh
         64PUVxjLHjBEHLbM3gfV2plRQ4eK7UueVKhHogwHkhKUBayMnHNoIpCA5jfbhUHPF4sY
         tzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702779495; x=1703384295;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFl8kjpw91XelbaLp/NqZrQDKjPZSUtARdmSUPQXSX8=;
        b=u+DrlVkLqGfkUPUvQo9283Qd2FY/Y7K+Sj9WrqJ1tIH5PZLjK9qivRbm1KUb8WWX+0
         wuyEOt2l8tk4jLlJl8GHXMdQqaQgLtiQSx4aJt93HXNirCcqLdLCjMvQGjvZJOWFr0GX
         CTq9LX/+Qy51XYvFE90wcYLlyLfmV9JNYMv0D4kitbrS1qj7fyEPhRRIUpZiYq2eyrJc
         Fk3u6+ca8IA0r8S9/YDfz4YemWDc9eQ6dmukEIIb7qA7a5KdqGQuNzDttU9PdC+jhCO4
         ssAFXGUvTyLOX9nmPfV12lM9yB0cqvOEDWqaDti9B5aSGcUFYPSdAcEZ6cd5acxeKStF
         e/yQ==
X-Gm-Message-State: AOJu0YxsySeH6p77qQW09LeSd/OznC8JU5gwdDNaCKLkzm2EH5SJeJxt
	qYBoYXD2Z9eU/c6Wvq/xxGrldg==
X-Google-Smtp-Source: AGHT+IF+rykhjl/vJMlMFtG1M64I68Xtmq2p6wjQt8Jp7El542Y7P1lc23SbwSwdEGVtxnixp9/AeQ==
X-Received: by 2002:a05:6808:3a09:b0:3b9:e828:816 with SMTP id gr9-20020a0568083a0900b003b9e8280816mr20647236oib.48.1702779495498;
        Sat, 16 Dec 2023 18:18:15 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:a30f:cc0e:7239:16c3])
        by smtp.gmail.com with ESMTPSA id ja11-20020a170902efcb00b001d39f6edd54sm1453638plb.84.2023.12.16.18.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 18:18:14 -0800 (PST)
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-34-201c483bd775@kernel.org>
 <875y1089i4.fsf@linaro.org>
 <485b6454-135c-4dd4-b38e-8fb8a02779cd@sirena.org.uk>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 34/39] kselftest/arm64: Add a GCS test program built
 with the system libc
In-reply-to: <485b6454-135c-4dd4-b38e-8fb8a02779cd@sirena.org.uk>
Date: Sat, 16 Dec 2023 23:18:13 -0300
Message-ID: <871qbl7esa.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Mark Brown <broonie@kernel.org> writes:

>> Also, it's strange that the tests defined after map_gcs.stack_overflow
>> don't run when I execute this test program. I'm doing:
>
>> $ ./run_kselftest.sh -t arm64:libc-gcs
>
>> I.e., these tests aren't being run in my FVP:
>
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, too_small)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_1)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_2)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_3)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_4)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_5)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_6)
>> > +FIXTURE_VARIANT_ADD(map_invalid_gcs, unligned_7)
>> > +TEST_F(map_invalid_gcs, do_map)
>> > +FIXTURE_VARIANT_ADD(invalid_mprotect, exec)
>> > +FIXTURE_VARIANT_ADD(invalid_mprotect, bti)
>> > +FIXTURE_VARIANT_ADD(invalid_mprotect, exec_bti)
>> > +TEST_F(invalid_mprotect, do_map)
>> > +TEST_F(invalid_mprotect, do_map_read)
>
> I'm seeing all of those appearing.  I'm not sure what to say there -
> that's all kselftest framework stuff, I'd expect the framework to say
> something about what it's doing if it decides to skip and I can't think
> why it would decide to skip.

Thanks. I'll poke some more to see if I can figure out what's going on.

-- 
Thiago

