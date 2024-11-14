Return-Path: <linux-doc+bounces-30816-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B01A39C8ED4
	for <lists+linux-doc@lfdr.de>; Thu, 14 Nov 2024 16:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E1DE282444
	for <lists+linux-doc@lfdr.de>; Thu, 14 Nov 2024 15:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C634217E44A;
	Thu, 14 Nov 2024 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="JPFbtK8n"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3C014E2D6
	for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 15:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731599451; cv=none; b=GiHdSBDU17n4/hn1oAvtv9rakv9FAyQHYBaz/tp86MHdkk2TsHldU/D8vb3cXeSCICyNRZYuoWv3us+EPDCOI/edjvGtbP6PVCE6+VkfLkE1ey934kZc2+G2+8DLviw7564vZi8On2crbkcK4GsPiCmcNnxVyS7DrgXAQoBPDcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731599451; c=relaxed/simple;
	bh=I4+lQoZDoE5obNmbEbXZVyNC16ObpAZr7xb70Tlb8u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrkI9xaFDZ2O+v8wiP+gqftETt7Q1poBSddX2kRrEyrHWgQ0gZyOMM5iN/RwJBvSYjzYEE4OTjiaTmkI1ZaGEa9PQs6ANhiRPMSrl23QAONZ0y9rS6x6UJxq29tpJ5rXZyFSguUF+gccGNaLQJAj6mbTB/gjaetHTYu5YsVfyHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=JPFbtK8n; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20e6981ca77so9920585ad.2
        for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 07:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731599449; x=1732204249; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AuaBMTy+AeJsJU9fm4AZ56hQq3E5HBpfOKLhTwWZNeQ=;
        b=JPFbtK8n7vK10qMiAGMkQV5oP3XPC9tk5kf0Yp9MIPs17610Qb1uCn89HsVtQzaU22
         h9zEtSMYEtG1Elkl3rFfMQ97UWJmk5oSH3FZPP3s89GSMpOu74Bu0oUycIlyW2fLSdz/
         f1eYv/zgXfwUg6yhxLhAbuNjA9EkECLHJ7v2+n98V9COIfVH8BP2HxSQbHLTHIZf+na9
         0+S7dj7kMIpeq0kaxAg9apWL7qk2BLtbryl3e1Ps1/fy9NBbGGAxoF8MEStP+BEtfPGC
         SUQgQuDW3t3ryMxvZf2sZ6pB9jM+/r6DA4NexLQ337PtsDdSrJttdx4iSkQ/mn7xasny
         RVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731599449; x=1732204249;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AuaBMTy+AeJsJU9fm4AZ56hQq3E5HBpfOKLhTwWZNeQ=;
        b=Lu1POP4UT7XD1pRlFPWkgPPNL3DJyscf0q3xVJcKqXIQ2kovFkdzwG8jE59WMwqWe9
         /gzPASpxUP3KiRLjQg33LtKiAX0KH7sOzTYhI6S1LtRRDGVESIAyuztdtCqEmpIu/FwW
         8hcjQLtyNMfWo1LpoknticsBR3OF4NXLcmgy1c1DgV0TeGNZjDV7OhisQd4uIkqi2Dtl
         qJCySjtluVYARv90PCAAWSWh/MqsNbUrX64/qCI/NhM+7IW23GtyvzQxv+pJtX6IvU1F
         obyk7wdacKhdLK5OZh5meR4DmJJg4RjPWwsZz5vRSaoQ5vtnfYfQtQa8Bqu66i3X+wE8
         Rciw==
X-Forwarded-Encrypted: i=1; AJvYcCX4Fcpl7/iWX8n4RZZOLIhs/39Eq5Oz7In6aF30wTjFglDQ5mj/RtwvmQNOu9GCNcXTq9lNVqD0I+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH9Y5/AmvJ73lNMgJntZRynwhy958n5wPpludRwsWBUuY9SE3S
	9H/1Kcoy+CcfcdETQ3syeqlgoervtCh0SocbuOSv84828QBckFhL4IrAEL2i82o=
X-Google-Smtp-Source: AGHT+IHTSbLYPW9H6IMMv3J9GeiSG052ik1ZNbE+SJ7zga3eJUIE3+gCfX95oRz+I+/KI8Ko3d5rzw==
X-Received: by 2002:a17:902:cec7:b0:20c:7d4c:64db with SMTP id d9443c01a7336-211b5d542aemr85459765ad.49.1731599449294;
        Thu, 14 Nov 2024 07:50:49 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7d377ecsm12256145ad.265.2024.11.14.07.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 07:50:48 -0800 (PST)
Date: Thu, 14 Nov 2024 07:50:45 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Nick Hu <nick.hu@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH v8 24/29] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
Message-ID: <ZzYcVW/4M0jab1T4@debug.ba.rivosinc.com>
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
 <20241111-v5_user_cfi_series-v8-24-dce14aa30207@rivosinc.com>
 <CAKddAkCCVjNHUinPWtOiK8Ki_ZkdoUCawfv1-+0B69J_1aJv5Q@mail.gmail.com>
 <ZzVNKvCu4MOs7O5z@debug.ba.rivosinc.com>
 <CAKddAkDbGYeONaksq6fzLzx47BHZo3Ar7Sog3MOgf7Y+Birovw@mail.gmail.com>
 <ZzVRbCZP9N4Os8Bj@debug.ba.rivosinc.com>
 <CAKddAkBCByf570PXfz798FtBbeGQWe2LJpdzxkE+jv3Zd3ZV1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKddAkBCByf570PXfz798FtBbeGQWe2LJpdzxkE+jv3Zd3ZV1w@mail.gmail.com>


Hi Nick,

Thanks for reviewing and helping.

On Thu, Nov 14, 2024 at 02:17:30PM +0800, Nick Hu wrote:
>Hi Deepak
>
>On Thu, Nov 14, 2024 at 9:25 AM Deepak Gupta <debug@rivosinc.com> wrote:
>>
>> On Thu, Nov 14, 2024 at 09:20:14AM +0800, Nick Hu wrote:
>> >Hi Deepak
>> >
>> >On Thu, Nov 14, 2024 at 9:06 AM Deepak Gupta <debug@rivosinc.com> wrote:
>> >> >> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>> >> >> index 356d5397b2a2..6244408ca917 100644
>> >> >> --- a/arch/riscv/kernel/head.S
>> >> >> +++ b/arch/riscv/kernel/head.S
>> >> >> @@ -164,6 +164,12 @@ secondary_start_sbi:
>> >> >>         call relocate_enable_mmu
>> >> >>  #endif
>> >> >>         call .Lsetup_trap_vector
>> >> >> +       li a7, SBI_EXT_FWFT
>> >> >> +       li a6, SBI_EXT_FWFT_SET
>> >> >> +       li a0, SBI_FWFT_SHADOW_STACK
>> >> >> +       li a1, 1 /* enable supervisor to access shadow stack access */
>> >> >> +       li a2, SBI_FWFT_SET_FLAG_LOCK
>> >> >> +       ecall
>> >> >>         scs_load_current
>> >> >>         call smp_callin
>> >> >>  #endif /* CONFIG_SMP */
>> >> >> @@ -320,6 +326,12 @@ SYM_CODE_START(_start_kernel)
>> >> >>         la tp, init_task
>> >> >>         la sp, init_thread_union + THREAD_SIZE
>> >> >>         addi sp, sp, -PT_SIZE_ON_STACK
>> >> >> +       li a7, SBI_EXT_FWFT
>> >> >> +       li a6, SBI_EXT_FWFT_SET
>> >> >> +       li a0, SBI_FWFT_SHADOW_STACK
>> >> >> +       li a1, 1 /* enable supervisor to access shadow stack access */
>> >> >> +       li a2, SBI_FWFT_SET_FLAG_LOCK
>> >> >> +       ecall
>> >> >>         scs_load_current
>> >> >>
>> >> >>  #ifdef CONFIG_KASAN
>> >> >>
>> >> >> --
>> >> >> 2.45.0
>> >> >>
>> >> >Should we clear the SBI_FWFT_SET_FLAG_LOCK before the cpu hotplug
>> >> >otherwise the menvcfg.sse won't be set by the fwft set sbi call when
>> >> >the hotplug cpu back to kernel?
>> >>
>> >> Hmm...
>> >>
>> >> An incoming hotplug CPU has no features setup on it.
>> >> I see that `sbi_cpu_start` will supply `secondary_start_sbi` as start
>> >> up code for incoming CPU. `secondary_start_sbi` is in head.S which converges
>> >> in `.Lsecondary_start_common`. And thus hotplugged CPU should be
>> >> issuing shadow stack set FWFT sbi as well.
>> >>
>> >> Am I missing something ?
>> >>
>> >This is the correct flow. However the opensbi will deny it due to the
>> >SBI_FWFT_SET_FLAG_LOCK already being set.
>> >So the menvcfg.sse will not set by this flow.
>> >
>> >if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
>> >                return SBI_EDENIED;
>> >
>>
>> hmm... Why?
>>
>> `conf` is pointing to per-hart state in firmware.
>>
>> On this incoming cpu, opensbi (or equivalent) firmware must have
>> ensured that this per-hart state doesn't have lock set.
>>
>> Am I missing something?
>>
>Current OpenSBI doesn't clear the lock in the warm init of the hotplug path.
>It seems like we need a patch to address it.

Got it thanks.
Since you already know what's the problem, can you send a patch to opensbi.
If you want rather have me do it, let me know. Thanks.

>
>Regards,
>Nick
>> >Regards,
>> >Nick
>> >> >
>> >> >Regards,
>> >> >Nick
>> >> >>
>> >> >> _______________________________________________
>> >> >> linux-riscv mailing list
>> >> >> linux-riscv@lists.infradead.org
>> >> >> http://lists.infradead.org/mailman/listinfo/linux-riscv

