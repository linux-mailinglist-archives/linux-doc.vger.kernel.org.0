Return-Path: <linux-doc+bounces-21008-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEB1935079
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jul 2024 18:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 406621C21347
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jul 2024 16:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D45144306;
	Thu, 18 Jul 2024 16:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q/KWhdqI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCA62E859
	for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 16:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721319288; cv=none; b=LvL41rnRIitIzwE/v3QgWWfnjcdBFVhnc7aNS7bpA+iagPiRakP2eJL2EiI7ZD5sF8x4qKdP2MgtjYD9ckBg513SuN6LbZfLa0ISfCP8nubqbgaAvgqx7sm24rUUmV0IZacLA9OfjBj2h1+MSgcqhirKeIP/Cr/yn8jaOsKDLNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721319288; c=relaxed/simple;
	bh=Igl5C4XQG84DDkmNlndYaVvzyi1zpEMAcWa5IkHXl5o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cqjbAFD38AnS6ovsO3nphHATPgtSOuYmXbjjXl5U7Ta9GqSZJFvqFc1jMxJvCfJPeThiVDINgzWmP/3mRpW0vEuTmKNXxqm82uQ0Jng6sSZzdKEkB1uBcxN5Ob0CyohRIkZ7vRV1H9PnT97nepA9eqpYzu7/bKIqIm3wz6uF1t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q/KWhdqI; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7fedb09357aso43398039f.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 09:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721319285; x=1721924085; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cKUm2Sno0VCM0sKj4rcn5Z8Kw9gJMdGTQrF0ZDE8JgQ=;
        b=Q/KWhdqIFnlSgLjI2xheYfdMDCSr5u6Jh0wKMbHKIxUVhJus2n2rFKsvmCtwywFhx0
         5Mci6a7wyEpztpBs4Y2kcv1q1wTd/AYRzHrGsAvJdlGaPLzZMfG4cSb0kcz4gnnscQOC
         xkaaDHPll9vg+nrLJAygboZrCK/6QGSMgPykS8fWLnu8o5mXq9PK35q7Vcp/0+MF1Cjc
         5mTVCM9i2WSMQbOazvriW195THEhdkkAAUwn6C6sujIAwJmcWRyhVQl9AYZC52em9fpa
         +fz+u6wUqDW43KxhZbhMU3cQkiGdutGVFYzhuEq2SVlEOXMkmdO3EtZuANMSSd/KwBxS
         bnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721319285; x=1721924085;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKUm2Sno0VCM0sKj4rcn5Z8Kw9gJMdGTQrF0ZDE8JgQ=;
        b=ZTc55GeQ/482Ui1nODJmvHnDyeVpumTZYa8SKIKXmyzN7FNg8PeYaOH/rU7DB+ZoGO
         g88Ym6Y5tghF3O+IBPd7pkG9hiQy3E8sWWtvLm518RbVYQfwOwiZV4NGnjBoVwuCR135
         h4bD/WdvuamLQNUTpVohEpAqxWvY5KJ+ejlsSYWDPNEeRNlh2FLQpg6HDoYyz+co+jko
         9odd1Fkbdw0YCDrGzP2HrfTnnKNxY8FCdG5tCOXYAV+8i/wdyJx5WpYMe4vS9noI5f9P
         sWmbPoY8TnWNusIR42SiVtlEbhICvNoV+YZ01vaeXbLzW8NrFmVXTleMlMO7cW8dwr/4
         uodA==
X-Forwarded-Encrypted: i=1; AJvYcCUxG6z+n82FY1QrIr2IbC2UIJdct94bQLyuQt/HMJ3MCmuuJDAxN/ewWCzQiN4Vmmuzy3nwDJF/jEB2/zJo/87McdD0YHgRVnQR
X-Gm-Message-State: AOJu0YwITnpApMrtGZ2cAvH8pm0+OXb0Q6j6HGdoMm+JFaXLGk/xzPRi
	Al4k5c7vex7+DU+c2WDyzj+8FRtwuvVhdwt+WH2ret4Cyy552svv3m7EaNYDxHI=
X-Google-Smtp-Source: AGHT+IGBl5SUOSetZ7hpvAsBcsY+3Cb2iftUEXypwidAC9j+tfeb4FVk4PWmNhC4HY+kt6K5hLBh4A==
X-Received: by 2002:a05:6602:3fcc:b0:804:657d:92fc with SMTP id ca18e2360f4ac-817123e1bb4mr642950839f.18.1721319284795;
        Thu, 18 Jul 2024 09:14:44 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:49aa:ec5c:43c8:2afb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e34d2c7e2sm7993415a12.54.2024.07.18.09.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 09:14:44 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Andrew Morton
 <akpm@linux-foundation.org>,  Marc Zyngier <maz@kernel.org>,  Oliver Upton
 <oliver.upton@linux.dev>,  James Morse <james.morse@arm.com>,  Suzuki K
 Poulose <suzuki.poulose@arm.com>,  Arnd Bergmann <arnd@arndb.de>,  Oleg
 Nesterov <oleg@redhat.com>,  Eric Biederman <ebiederm@xmission.com>,
  Shuah Khan <shuah@kernel.org>,  "Rick P. Edgecombe"
 <rick.p.edgecombe@intel.com>,  Deepak Gupta <debug@rivosinc.com>,  Ard
 Biesheuvel <ardb@kernel.org>,  Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
  Kees Cook <kees@kernel.org>,  "H.J. Lu" <hjl.tools@gmail.com>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Florian Weimer <fweimer@redhat.com>,
  Christian Brauner <brauner@kernel.org>,  Ross Burton
 <ross.burton@arm.com>,  linux-arm-kernel@lists.infradead.org,
  linux-doc@vger.kernel.org,  kvmarm@lists.linux.dev,
  linux-fsdevel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linux-mm@kvack.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 35/39] kselftest/arm64: Add a GCS test program built
 with the system libc
In-Reply-To: <20240625-arm64-gcs-v9-35-0f634469b8f0@kernel.org> (Mark Brown's
	message of "Tue, 25 Jun 2024 15:58:03 +0100")
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
	<20240625-arm64-gcs-v9-35-0f634469b8f0@kernel.org>
Date: Thu, 18 Jul 2024 13:14:41 -0300
Message-ID: <87plray8we.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> There are things like threads which nolibc struggles with which we want
> to add coverage for, and the ABI allows us to test most of these even if
> libc itself does not understand GCS so add a test application built
> using the system libc.
>
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/gcs/.gitignore |   1 +
>  tools/testing/selftests/arm64/gcs/Makefile   |   4 +-
>  tools/testing/selftests/arm64/gcs/gcs-util.h |  10 +
>  tools/testing/selftests/arm64/gcs/libc-gcs.c | 736 +++++++++++++++++++++++++++
>  4 files changed, 750 insertions(+), 1 deletion(-)

In my FVP VM, this test gets a GCS SIGSEGV before running the first test:

$ sudo ./run_kselftest.sh -t arm64:libc-gcs
[sudo] password for bauermann:
TAP version 13
1..1
# timeout set to 45
# selftests: arm64: libc-gcs
# TAP version 13
# 1..118
# # Starting 118 tests from 32 test cases.
# #  RUN           global.can_call_function ...
# Segmentation fault
not ok 1 selftests: arm64: libc-gcs # exit=139
$ 

It happens when returning from the syscall() glibc function that does
the clone3 syscall in kselftest_harness.h:

$ /var/tmp/gdb-gcs/bin/gdb -q arm64/libc-gcs
Reading symbols from arm64/libc-gcs...
(gdb) r
Starting program: /var/tmp/selftests-v9/arm64/libc-gcs
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/aarch64-linux-gnu/libthread_db.so.1".
TAP version 13
1..118
# Starting 118 tests from 32 test cases.
#  RUN           global.can_call_function ...
[Detaching after vfork from child process 823]

Program received signal SIGSEGV, Segmentation fault
Guarded Control Stack error.
syscall () at ../sysdeps/unix/sysv/linux/aarch64/syscall.S:41 [GCS error]
warning: 41     ../sysdeps/unix/sysv/linux/aarch64/syscall.S: No such file or directory
(gdb) p $_siginfo.si_signo
$1 = 11
(gdb) p $_siginfo.si_code
$2 = 10
(gdb) p $_siginfo._sifields._sigfault.si_addr
$3 = (void *) 0xfffff7ed96b0 <syscall+48>
(gdb) disassemble
Dump of assembler code for function syscall:
   0x0000fffff7ed9680 <+0>:     nop
   0x0000fffff7ed9684 <+4>:     mov     w8, w0
   0x0000fffff7ed9688 <+8>:     mov     x0, x1
   0x0000fffff7ed968c <+12>:    mov     x1, x2
   0x0000fffff7ed9690 <+16>:    mov     x2, x3
   0x0000fffff7ed9694 <+20>:    mov     x3, x4
   0x0000fffff7ed9698 <+24>:    mov     x4, x5
   0x0000fffff7ed969c <+28>:    mov     x5, x6
   0x0000fffff7ed96a0 <+32>:    mov     x6, x7
   0x0000fffff7ed96a4 <+36>:    svc     #0x0
   0x0000fffff7ed96a8 <+40>:    cmn     x0, #0xfff
   0x0000fffff7ed96ac <+44>:    b.cs    0xfffff7ed96b4 <syscall+52>  // b.hs, b.nlast
=> 0x0000fffff7ed96b0 <+48>:    ret
   0x0000fffff7ed96b4 <+52>:    b       0xfffff7e18660 <__GI___syscall_error>
   0x0000fffff7ed96b8 <+56>:    b       0xfffff7e18660 <__GI___syscall_error>
End of assembler dump.
(gdb) bt
#0  syscall () at ../sysdeps/unix/sysv/linux/aarch64/syscall.S:41 [GCS error]
#1  0x0000aaaaaaaa4acc in clone3_vfork ()
    at /home/bauermann/src/linux/tools/testing/selftests/kselftest_harness.h:93
#2  __run_test (f=f@entry=0xaaaaaaac0b88 <_fixture_global>, variant=variant@entry=0xffffffffee00,
    t=t@entry=0xaaaaaaac0018 <_can_call_function_object>)
    at /home/bauermann/src/linux/tools/testing/selftests/kselftest_harness.h:1239 [GCS error]
#3  0x0000aaaaaaaa2c40 in test_harness_run (argv=0xfffffffff008, argc=1)
    at /home/bauermann/src/linux/tools/testing/selftests/kselftest_harness.h:1314
#4  main (argc=1, argv=0xfffffffff008) at libc-gcs.c:735 [GCS error]
(gdb) 

And indeed, the svc call in the disassemble above corrupts the GCS.
This is the GCS and lr values right before the svc call:

(gdb) x/i $pc
=> 0xfffff7ed96a4 <syscall+36>: svc     #0x0
(gdb) p/x $lr
$3 = 0xaaaaaaaa4acc
(gdb) p/x $gcspr
$4 = 0xfffff7bfffe8
(gdb) x/g $gcspr
0xfffff7bfffe8: 0x0000aaaaaaaa4acc

So far so good, the tip of the GCS matches $lr. But then:

(gdb) stepi
[Detaching after vfork from child process 2491]
39      in ../sysdeps/unix/sysv/linux/aarch64/syscall.S
(gdb) x/i $pc
=> 0xfffff7ed96a8 <syscall+40>: cmn     x0, #0xfff
(gdb) p/x $gcspr
$5 = 0xfffff7bfffe8
(gdb) x/g $gcspr
0xfffff7bfffe8: 0x0000aaaaaaaa4c04
(gdb) p/x $lr
$6 = 0xaaaaaaaa4acc

So, right after svc returns, the tip of the GCS is corrupted and will
cause the GCS error.

-- 
Thiago

