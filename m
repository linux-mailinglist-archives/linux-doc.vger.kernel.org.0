Return-Path: <linux-doc+bounces-16125-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 307048C1544
	for <lists+linux-doc@lfdr.de>; Thu,  9 May 2024 21:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B34F5B22126
	for <lists+linux-doc@lfdr.de>; Thu,  9 May 2024 19:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB6C7F49A;
	Thu,  9 May 2024 19:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="p6BR47fZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02C2653
	for <linux-doc@vger.kernel.org>; Thu,  9 May 2024 19:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715282196; cv=none; b=KH6tLhS9A7ZIKPiO66SprzTZxewhx8TOLjutxbfEfBpwU+7TZZXuyWt0x0NkuRsE/GblCMX3mOeoYJeA5XkLFiG7soF1F2XMpHmpoTnwqD6Ky66EQB37uTp4wgmrW5WgfjMD427LfveFhD+j0TE0zej8ht848PqNIuGZ9OkVO1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715282196; c=relaxed/simple;
	bh=uCzgFU7wXjy37E1QSOA4C4Ah2huDwMghRUAkC14wOZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuDlZiBujaoTLVU7uieICn6K13X3eV6+E+pr9DpZYBNgm8BvXG7qeZXZEf8AfRWmtyvo39c9e8Z38v80xB84bqbmWG3u792ujcF6JdB8eZy3VrCmlLNNDniBn0OmxYGLDJZs1mobPYp1IE4ETHAuyHZWNAThe/rXwKoYgN5Y4io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=p6BR47fZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1eeb1a4c10aso8342835ad.3
        for <linux-doc@vger.kernel.org>; Thu, 09 May 2024 12:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715282194; x=1715886994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WRd0Lx0MMpPCEzZHJ+gP+MBiwgoDsG5pFDJFXbEvS5E=;
        b=p6BR47fZUkBd+uEdgLV91HLP/3f8tz9FUAZcMX1txl2WZCfGJTdp+7ji7eQ0HJsIou
         7oDP3spbl6HXwjHBby8bB/D4x6YAMaqRKzXJBlD4nR67TSGhm7SCE647B6SSEUJ8cTnW
         fXcRNJvRz0Uplw5AzETVF11LV3u0ZPVCdmAn5TnXS5lS4B6G/sQxncQ3DUCtaLGdH6hY
         0/wmfs5EFIvkcZ8CMM8N9L9EDURm/c51QsQOAne3xTpfu1cKo7jKfC/FSo2cxUBkurQZ
         kqrKu2kLpo8YPfyXBwxJOGyMy0Bnu8hLZtJ2xHu1VEHHRIaNOdIHaPeK381vB82/GWxY
         tZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715282194; x=1715886994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRd0Lx0MMpPCEzZHJ+gP+MBiwgoDsG5pFDJFXbEvS5E=;
        b=xC0mIEVULUib7s1IHhECcANzTrnwCtrikfPSVRYnYeyLxY2N/RtODZ4hcU6387duKq
         SkXQklfrSsNlcnt15+PKj0ZTRvp/NpYqI17wdmNqvuG3coAwzepnCQPEYZD+Vs2ATX0U
         9CSNn0SveICm6DybVRlGulbo+IRmhIuIOf80vJfhEko/WmAWu8P4X7qNnW/6K11xG/Y8
         QhgiB080d6g3vP5ddo43d6puxVVwD0LB/xxZcoVmL6mome1kVLEymfZyWJLWEGKdFEoE
         bBhwOief0VAN9+DrCBfYgjn/lEnfl5GRpi2R8OcCKhb5Mq3EsKCkzQIWozc+yW7hzrsu
         Tpkw==
X-Forwarded-Encrypted: i=1; AJvYcCVe/dVwf4YkJw4sZx1KTiw+uzeGUv5Y8YHXmNvlW/b0rlFO6fGmI8s8IGBdagDEpXHPKlSOsbsadd8VFl6Zl/ZGHkE3R7AWkJYJ
X-Gm-Message-State: AOJu0YwwkNG55c+FYBJBqUWa4ImVLbOZ5Fgc+c49BzqKC7qzyxD+BomF
	y4zAv2hvBI9W0pykb3TV8fn3L7ahkqx5t7QB3IPpJxvxiEDhX4/0+siJhaF3LQw=
X-Google-Smtp-Source: AGHT+IGVLZ1hk7FPNudPJKafIIo2jYjbH8+I3TnNil7Sy8OT8DfcbS5dMB3RJTTTCW5vQbF2H1ruBQ==
X-Received: by 2002:a17:903:191:b0:1dc:de65:623b with SMTP id d9443c01a7336-1ef4404b8cdmr7695675ad.60.1715282194292;
        Thu, 09 May 2024 12:16:34 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13692asm17812885ad.252.2024.05.09.12.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 12:16:33 -0700 (PDT)
Date: Thu, 9 May 2024 12:16:29 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 29/29] kselftest/riscv: kselftest for user mode cfi
Message-ID: <Zj0hDT1EZmOaEkCj@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-30-debug@rivosinc.com>
 <Zj0UGweLoRD1U9Po@ghost>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Zj0UGweLoRD1U9Po@ghost>

On Thu, May 09, 2024 at 11:21:15AM -0700, Charlie Jenkins wrote:
>On Wed, Apr 03, 2024 at 04:35:17PM -0700, Deepak Gupta wrote:
>> +
>> +int main(int argc, char *argv[])
>> +{
>> +	int ret = 0;
>> +	unsigned long lpad_status = 0, ss_status = 0;
>> +
>> +	ksft_print_header();
>> +
>> +	ksft_set_plan(RISCV_CFI_SELFTEST_COUNT);
>> +
>> +	ksft_print_msg("starting risc-v tests\n");
>> +
>> +	/*
>> +	 * Landing pad test. Not a lot of kernel changes to support landing
>> +	 * pad for user mode except lighting up a bit in senvcfg via a prctl
>> +	 * Enable landing pad through out the execution of test binary
>> +	 */
>> +	ret = my_syscall5(__NR_prctl, PR_GET_INDIR_BR_LP_STATUS, &lpad_status, 0, 0, 0);
>
>There is an assumption here that the libc supports setting
>INDIR_BR_LP_STATUS but does not support the standard prctl interface
>defined in <sys/prctl.h>. my_syscall5() is defined to fill in gaps in
>the libc, so this test case should also set the status manually rather
>than relying on the libc.
>
>I don't think it's necessary to define my_syscall5() since every libc
>should have a prctl() definition. However, these CFI prctls are very new
>and glibc does not yet support (correct me if I am wrong) it so these
>prctls should be enabled by the test cases.

In one of my previous patches, it was setting landing pad and shadow stack enabling
directly via handcrafted prctl macro. I changed it to check for status for following reasons

- If this binary is compiled with landing pad and shadow stack option then toolchain being used
   already has libc with shadow stack and landing pad enabling

- Currently upstream glibc toolchain dont have support but libc with toolchain has the support.

In case of shadow stack enabling, macro is needed and `prctl` function can't be used.
Because you enter `prctl` function with no shadow stack but exit with shadow stack and will lead to
fault in its epilog.

Due to all these reasons, kselftests have to be compiled with toolchain with cfi codegen and thus libc
should have support to light them up. Here tests only checks if they are already lit up, If not it fails.

Although you're spot on one thing here, since this test is assuming libc already lit-up landing pad and
shadow stack. It doesn't need macro here for status check of feature and can simply use `prctl` syscall
interface.

>
>- Charlie
>
>> +	if (ret)

