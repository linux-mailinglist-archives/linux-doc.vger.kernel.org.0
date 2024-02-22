Return-Path: <linux-doc+bounces-10355-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC4285EE2C
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 01:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90FDEB239C8
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 00:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54544EAE7;
	Thu, 22 Feb 2024 00:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="MrLKmCi4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CE0F4E7
	for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 00:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708562404; cv=none; b=K9fUI1+2iEGjacBzpq8+kOTAZGKiCHXma7UeqSCkqvhlolFBV9QgRoD4HXOxXguX0YpwFc8ye0oPZLY9okTTpZGv17VR/7O3Ct+NsHy3TiukofRYjf3mqqmvALAJYbWqbB/7f+79Ub9spzzn+P/iyapHMLiddyLMf8LTFMOtOb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708562404; c=relaxed/simple;
	bh=3cPh5EYVwGWaYgvsr8YLKJcb0/yJUuFAluKjFfz/1Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzqcNphyzatFEPNe3epaoKGZztUYlBpNOpT2QGpTW2QBtG/8AFWcXjH9RbCnpVwTuLzEvf2yUPIxQoHqVXAvg1fm7/vKzZx9rI96pZrXtb+/xHsGGh7C5OITO8ArsNjHvJPk9JSiu00+q3xGBCPldYBcR5/DTgBH57ZHsUcCtOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=MrLKmCi4; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5dca1efad59so6683991a12.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 16:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708562402; x=1709167202; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3cPh5EYVwGWaYgvsr8YLKJcb0/yJUuFAluKjFfz/1Eo=;
        b=MrLKmCi4BmAp5eYeFcOMeqQGDgSbpL/pOSxuO1z6vKvVfM50hQsEDkjCohesjLgRI6
         3kl3r3Ttn9qadyDk/JdASepgleKakrM3Y95GBF2XS65GgoOgUKl9bozx+++np/XIb+6x
         K0pdbQYqoAMXv3n/kiUyBE0PEp6uDDgFTBfBsC+JjQYwVwXr8siNlaaRPkEcR65iK7SX
         wRQeTrhLhUu/VWeqr3+69+C8bGmTY8pYE8sGcn5WRPYaesKwGR76tD92974RkPUORtuE
         5hx+A7kojYNgklKk9wO8i5IB2o/FwIJpCb3rDPCsXntXuGGoF1qCCczDdvmZQFQ8m9VO
         FU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708562402; x=1709167202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3cPh5EYVwGWaYgvsr8YLKJcb0/yJUuFAluKjFfz/1Eo=;
        b=saqf/XDLJZmsfWWeQuUGsHrUFj4clCuRGC1I7A6QfB4YNmOWXBUEoRCzRPdhr1dvoA
         C0vuLZHn7drLY+v/ooGLfTIZyMh6tfiACgjqQYZBLclTmTM2MR6ISt1p4GOe+l6p55yO
         WgQd+OO+Kcu+J3qFAMld7hc4zfbk+8gTjEkOGQdDkqpPQ2a1+yx5ImlFtlYV5BvT5F9H
         71CYIoU3YK+akU6yr0ZIJVTo15snVUh/aw78YbiGUAtVsS//qP96YIL9XA+TbjhJimj8
         vTsoXyptnh74RiyLRvsN5fXdEBmd23KfCSkb7E1yZBPiMbVmhIWGAGhSg8QOeGUfWzy/
         dCxg==
X-Forwarded-Encrypted: i=1; AJvYcCXXqwO0T4BvM7VimmcOdNjrMBTmE/FhWNhUUoz24vCp08k+0Ez/C88v+o9s4DoWeAW2IrDY+B3/yTCehLxn+p1qeigrwCajKLqz
X-Gm-Message-State: AOJu0YxpoCP8DrhVmheKNNrleqtwGDz/7byyQqXEvkmmnRvjjMZtCmlP
	SU+fjgafgZdxnEVglqvkTpMaOAjfqLKJyFXzivAzmHgFLeqB74AMdvu2KqLFLU0=
X-Google-Smtp-Source: AGHT+IGotfMmm5x9Xi19DeFfmbyjknJKTAh4y49q6+Q/YPgYYL/De9ObYQYYyxWmR72uNSf6FbQ1Zw==
X-Received: by 2002:a17:90a:72c6:b0:299:4fa7:71e5 with SMTP id l6-20020a17090a72c600b002994fa771e5mr11324761pjk.8.1708562402076;
        Wed, 21 Feb 2024 16:40:02 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id qc17-20020a17090b289100b002993743e4a7sm2480570pjb.20.2024.02.21.16.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 16:40:01 -0800 (PST)
Date: Wed, 21 Feb 2024 16:39:57 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"kito.cheng@sifive.com" <kito.cheng@sifive.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"alexghiti@rivosinc.com" <alexghiti@rivosinc.com>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>,
	"cleger@rivosinc.com" <cleger@rivosinc.com>,
	"josh@joshtriplett.org" <josh@joshtriplett.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"gerg@kernel.org" <gerg@kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"bhe@redhat.com" <bhe@redhat.com>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>,
	"david@redhat.com" <david@redhat.com>,
	"samitolvanen@google.com" <samitolvanen@google.com>,
	"heiko@sntech.de" <heiko@sntech.de>,
	"panqinglin2020@iscas.ac.cn" <panqinglin2020@iscas.ac.cn>,
	"mchitale@ventanamicro.com" <mchitale@ventanamicro.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"revest@chromium.org" <revest@chromium.org>,
	"mason.huo@starfivetech.com" <mason.huo@starfivetech.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"baruch@tkos.co.il" <baruch@tkos.co.il>,
	"waylingii@gmail.com" <waylingii@gmail.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"ancientmodern4@gmail.com" <ancientmodern4@gmail.com>,
	"mathis.salmen@matsal.de" <mathis.salmen@matsal.de>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"shr@devkernel.io" <shr@devkernel.io>,
	"andy.chiu@sifive.com" <andy.chiu@sifive.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"vincent.chen@sifive.com" <vincent.chen@sifive.com>,
	"greentime.hu@sifive.com" <greentime.hu@sifive.com>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"willy@infradead.org" <willy@infradead.org>,
	"zhangqing@loongson.cn" <zhangqing@loongson.cn>,
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"Wang, Xiao W" <xiao.w.wang@intel.com>,
	"cuiyunhui@bytedance.com" <cuiyunhui@bytedance.com>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"ruscur@russell.cc" <ruscur@russell.cc>,
	"shikemeng@huaweicloud.com" <shikemeng@huaweicloud.com>,
	"jszhang@kernel.org" <jszhang@kernel.org>,
	"jeeheng.sia@starfivetech.com" <jeeheng.sia@starfivetech.com>,
	"alx@kernel.org" <alx@kernel.org>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"omosnace@redhat.com" <omosnace@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"evan@rivosinc.com" <evan@rivosinc.com>,
	"bgray@linux.ibm.com" <bgray@linux.ibm.com>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [RFC PATCH v1 11/28] riscv: Implementing "PROT_SHADOWSTACK" on
 riscv
Message-ID: <ZdaX3ckwaKO7YB2Y@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-12-debug@rivosinc.com>
 <2914cf78e47010e195d963857b37807e8446e3be.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2914cf78e47010e195d963857b37807e8446e3be.camel@intel.com>

On Fri, Feb 09, 2024 at 08:44:35PM +0000, Edgecombe, Rick P wrote:
>On Wed, 2024-01-24 at 22:21 -0800, debug@rivosinc.com wrote:
>> +       /*
>> +        * PROT_SHADOWSTACK is a kernel only protection flag on risc-
>> v.
>> +        * mmap doesn't expect PROT_SHADOWSTACK to be set by user
>> space.
>> +        * User space can rely on `map_shadow_stack` syscall to
>> create
>> +        * shadow stack pages.
>> +        */
>> +       if (unlikely(prot & PROT_SHADOWSTACK))
>> +               return -EINVAL;
>
>Are you sure you need PROT_SHADOWSTACK? Since you are passing
>VM_SHADOW_STACK into do_mmap() directly.

Sorry for (very) late response.
In this patch series since VM_SHADOW_STACK was an alias to VM_WRITE.
And that's why I needed PROT_SHADOWSTACK to disambiguate.

I am updating my patches and going with ARCH_5 bit (and thus only 64bit support).
So x86, aarch64 and risc-v will be using same bit position.


