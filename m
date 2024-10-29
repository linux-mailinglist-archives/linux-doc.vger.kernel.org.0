Return-Path: <linux-doc+bounces-29066-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3289B5580
	for <lists+linux-doc@lfdr.de>; Tue, 29 Oct 2024 23:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A1231F23D63
	for <lists+linux-doc@lfdr.de>; Tue, 29 Oct 2024 22:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE9B20A5E9;
	Tue, 29 Oct 2024 22:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PadVNxZq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B73420A5C5
	for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 22:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730239580; cv=none; b=mHNQZf4bbi6nP/VcLQ87CXRQatqaX/xZM+c5ynLggzSSO2cEK3no8DnB1/GQsD3TmKjZqGBGkaCVnpWTd3N3nD3i6LxOr5Q2oTrkWLq07V1XQGl8mtRDFyG+gk3ZqFYxSeNW+P4AYlqfaW9Se7Oe4GUt18IiEEvdiasrRwRAlE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730239580; c=relaxed/simple;
	bh=CdnbR/n993Dh7J950f0c8ickmtl2eIv2b48/LGPN6M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llCuoDNSCeeSf+60LaZZGmqWc+8ZNaJdtpoMh9H2MQKrJ6BqxGr46CkcHhTURCXy7CtBWDWwaUFZcLyhGKunMmTO/m47rexCxWqNxQUQrVdBJx7PXlIWc8n9Wp3Q3PPshL1QWMZamxy5OIoOq/kWNfb+CnQtcsCv4u0mkeU7pkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PadVNxZq; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e8235f0b6so4544919b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 15:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730239577; x=1730844377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4EACvvUKKkKxlPkQ/qPPcljk+9uxcKmU+j4zoW5wcX4=;
        b=PadVNxZqeHrWwJwK+Q5cSKRBJhn5u8gX4hHMsIwXT240V4mxzFeO0/pWxMLquHVGmy
         TKfwUpjcuBBPp48P7Uxuu/dkf7RZszDosvL2Znda4htaxpNVjMXq5EeJFYiJFLeqWjxJ
         bhQXw1dySWtG0kyz84B/o/NgCLB1lxLS2LpYDtJpqFq+oqzne/i4YbFpoCLMHTZ1EV7g
         BV7QZjnPJ8dPWxXMR8WRsTPNMC0XBF6Jgf+BYRCCwBQ04ciTgqmNcK2GQ46i6ghYDUDT
         ZRIQr0yXmtgV53eqmXlQe0ITVOQ27bLVd9ug1UJ7HaysW40Q6K1/A0qf8TBBF+oSw4+F
         Vtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730239577; x=1730844377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EACvvUKKkKxlPkQ/qPPcljk+9uxcKmU+j4zoW5wcX4=;
        b=RVkmxRkoMyODUvyMHfMmQEljbXkNhNCm4kQXz6pbCONEtoI28u+fgGK21GNP7E1a46
         2AKTD4RCVZdmOziXTjocBqGkknupZ9n0QjPUcuJ2axG78BzwhqhIi/hOe20SIY62wbsI
         tSBLP7s87852XzLwhvgThGubfkzjIhFI4CTLlJm+jJmf2eCoTYdQ5GOwOrqiRsDnNx+M
         +E6IbzrmEGjoALGaz9Y7GTtcsIq/IsJrZZ0HWmA4n2FS/0UetKR4lCT6djtyXQsC8xmm
         Tk81FvkLjnq2sd+KHpwH94lj763kYo2jFbL53hNGKFNuJqsaFY/1JG5iFo4ry0/+10lW
         30qg==
X-Forwarded-Encrypted: i=1; AJvYcCXxDpeR4MycxiWYiDwII/5vCUjF/JRlakY1KCPdNMqIxc6woV8OvNZi+NTCzG35KJ7PTIwVzBsagvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRS9TpoIwMTD1DVDIvbAoc13XIrxCjFdif2lor+b2caH1zGdPz
	IsilQR7ndo44UpCsiACrvB1nViVfIxwIxKbWPooIwk5tBL1mW6fIpXvUkLTdA/4=
X-Google-Smtp-Source: AGHT+IGu+eejp1brQK3EJJSUet3qZ/a8s4zNTUr6AdFScB1Xjyv2wQw7qpS7Goqe3NU4f5vJRYVCtw==
X-Received: by 2002:a05:6a00:9286:b0:71e:db72:3c87 with SMTP id d2e1a72fcca58-7206306effemr15837533b3a.20.1730239577232;
        Tue, 29 Oct 2024 15:06:17 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720579397d8sm8135017b3a.86.2024.10.29.15.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 15:06:16 -0700 (PDT)
Date: Tue, 29 Oct 2024 15:06:13 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
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
	samitolvanen@google.com, rick.p.edgecombe@intel.com
Subject: Re: [PATCH v6 06/33] riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
Message-ID: <ZyFcVSMh2hJ+wAAa@debug.ba.rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
 <20241008-v5_user_cfi_series-v6-6-60d9fe073f37@rivosinc.com>
 <ZwZow-L3d_ZeONvq@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZwZow-L3d_ZeONvq@finisterre.sirena.org.uk>

On Wed, Oct 09, 2024 at 12:28:03PM +0100, Mark Brown wrote:
>On Tue, Oct 08, 2024 at 03:36:48PM -0700, Deepak Gupta wrote:
>
>> riscv will need an implementation for exit_thread to clean up shadow stack
>> when thread exits. If current thread had shadow stack enabled, shadow
>> stack is allocated by default for any new thread.
>
>FWIW both arm64 and x86 do this via deactivate_mm().  ISTR there's some
>case where exit_thread() doesn't quite do the right thing but I can't
>remember the specifics right now, possibly the vfork() case but ICBW?
>In any case like Rick said factoring out the common patterns would be
>good, keeping things aligned would support that.

Now getting back to collecting feedback and sending another version.
Yeah I found what you meant.
https://lore.kernel.org/all/20230908203655.543765-1-rick.p.edgecombe@intel.com/#t

Seems like an issue for riscv as well. Will fix it.
This particular issue screaming out loud for converging flows as well.



