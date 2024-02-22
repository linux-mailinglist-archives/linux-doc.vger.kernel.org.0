Return-Path: <linux-doc+bounces-10430-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B798860087
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 19:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E654C284555
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 18:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA391586CF;
	Thu, 22 Feb 2024 18:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="W+zp04zb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C6C15697D
	for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 18:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708625537; cv=none; b=ZiYHT1/f2iKJqVawZn/b08NGznMN7ROx53udT75Zu8mJRMqZLRoIUYq0DFLRKm4QqGoJ9TB9bqCtZs06YFPKuJHRNAonHDXlrdlXpW8CpiMIOcEqzop3JNsAIfzUHdN9P/eHX4p9AJQ1+bJOKkIryzYvU7hQDkENxGP1FVVG0b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708625537; c=relaxed/simple;
	bh=DPKDXhwMKF+B21xfPp2Xh9Ev5+Rn/9eQmV8Q0bIY9iE=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=ozo7Wvt2z4RKO6eufitKU8kT2Xy801SV/uo5rQRRr56RrrW27t/FgWLu8+bJ4SXTscH4R+oFHYmS8c88Kk9qA7Y/E79WErf+Asf8acgDDVEsc78v4IUKLPF5p9oiLVm9OVm01pxJo1YnljCW/uc54R62sxkF3Ah9BcrEF+XMKrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=W+zp04zb; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-365220a2c3dso24716335ab.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 10:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1708625534; x=1709230334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74bdP9ntSNlgi9eqvP/1WueCOOc9bZEyjpMNXvBbiyI=;
        b=W+zp04zbyjqTCxfQRXCx621YhAmOf+B96JbNgZpvMjWbLP2aHAEzXPR5MorGb4vT5i
         qW+pI/XY85DmiekKmANtZJ3FEh/kMkCgSTvzd2tQjKCY98Bifwy82NMF3mO2lPVG51vG
         FLvb2J8V6+KLeeKpIcHRPpMskbMcWOJ+nq6vNvmbJjiVyBaA5BQasCALbTAj5J6ICO7I
         ublgMrVmmwZHjlFhkM3k6A1qrE5xUAayCWYt7sKqGYEvhzZwgfDz2PB1AcrgqTwpcptG
         /+SuH+xWtDZWVK8zGFPfj68Am3uhOvQS/k9bLIcMyfpKx2Epzrwg0Hf2066KegRB3kLB
         WaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708625534; x=1709230334;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74bdP9ntSNlgi9eqvP/1WueCOOc9bZEyjpMNXvBbiyI=;
        b=UJuuszCdTd0mnOVXdSNsAD8Mpi/QGKuLsyvHNw7rGu27IDtHM/EYdl82pLpUVADh8/
         j/YSUpmhjvLAvor8jxdheB0bWqeWPC3eRberhQZ+PT8gieMAUD8qrhhCVVtBmuHHFU0o
         w5Y2kMY/oKm1VtD6OZb1QQXZVvn/9IwPBAyAptSPTume9txCcZKckeWNHW1CDIp/razf
         fKCwU+ureFYy1X0Tt5TLdsgE+nfHPcC+Vv0rK1TvcpNZfq1eJMqdK7/n2Cv3ipGHq308
         +yipO65+92LSHTcAY9TEvo58SXITIswJUNWNuJf64fU7X95up5qWxWkLEoqNvl88ynUx
         8CGg==
X-Forwarded-Encrypted: i=1; AJvYcCX4O1VFRw93IraInpKzT1aYJdwJzYQUYoEnQwYD5eKi89z664JZFVw2wcL1G2r/hn/8kBcWY8O1tImWiSK0ID86R8YxyBgCjOs3
X-Gm-Message-State: AOJu0YzGKoRYuIGraBry5qF+hsDt4zptX+prHSy/d1utB1VznVahGwHD
	2cMbDRjCj50ExOJspC1z97kMsD8WXsuCTpd4I+VNinEcEPFQBxX4HqQt4FVplY8=
X-Google-Smtp-Source: AGHT+IHEU0mqPccmhmy7V5QsN55AqKgFYRCvWyQ3UeVmBh7SkiI3lYgPdUTHoWwVZVLa7tiAUdKP5g==
X-Received: by 2002:a05:6e02:f46:b0:363:dfc7:acc1 with SMTP id y6-20020a056e020f4600b00363dfc7acc1mr19081532ilj.2.1708625534044;
        Thu, 22 Feb 2024 10:12:14 -0800 (PST)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm10749199pga.71.2024.02.22.10.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 10:12:13 -0800 (PST)
Date: Thu, 22 Feb 2024 10:12:13 -0800 (PST)
X-Google-Original-Date: Thu, 22 Feb 2024 10:12:11 PST (-0800)
Subject:     Re: [PATCH v6 0/4] StarFive's StarLink PMU Support
In-Reply-To: <20240222125707.GA8589@willie-the-truck>
CC: jisheng.teoh@starfivetech.com, corbet@lwn.net,
  Mark Rutland <mark.rutland@arm.com>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
  dan.j.williams@intel.com, ilkka@os.amperecomputing.com, Jonathan.Cameron@huawei.com,
  dave.jiang@intel.com, leyfoon.tan@starfivetech.com, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Will Deacon <will@kernel.org>
Message-ID: <mhng-008f9a14-40fe-4522-93f1-e7ebb1233931@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 22 Feb 2024 04:57:08 PST (-0800), Will Deacon wrote:
> On Mon, Jan 29, 2024 at 05:51:37PM +0800, Ji Sheng Teoh wrote:
>> This patch series adds support for StarFive's Starlink Performance
>> Monitor Unit(PMU).
>> StarFive's StarLink PMU integrates one or more CPU cores with
>> a shared L3 memory system. The PMU supports overflow interrupt,
>> up to 16 programmable 64bit event counters, and an independent
>> 64bit cycle counter.
>> StarLink PMU is accessed via MMIO.
>>
>> Example Perf stat output:
>> [root@user]# perf stat -a -e /starfive_starlink_pmu/cycles/ \
>>         -e /starfive_starlink_pmu/read_miss/ \
>>         -e /starfive_starlink_pmu/read_hit/ \
>>         -e /starfive_starlink_pmu/release_request/  \
>>         -e /starfive_starlink_pmu/write_hit/ \
>>         -e /starfive_starlink_pmu/write_miss/ \
>>         -e /starfive_starlink_pmu/write_request/ \
>>         -e /starfive_starlink_pmu/writeback/ \
>>         -e /starfive_starlink_pmu/read_request/ \
>>         -- openssl speed rsa2048
>> Doing 2048 bits private rsa's for 10s: 5 2048 bits private RSA's in
>> 2.84s
>> Doing 2048 bits public rsa's for 10s: 169 2048 bits public RSA's in
>> 2.42s
>> version: 3.0.11
>> built on: Tue Sep 19 13:02:31 2023 UTC
>> options: bn(64,64)
>> CPUINFO: N/A
>>                   sign    verify    sign/s verify/s
>> rsa 2048 bits 0.568000s 0.014320s      1.8     69.8
>> /////////
>>  Performance counter stats for 'system wide':
>>
>>          649991998      starfive_starlink_pmu/cycles/
>>            1009690      starfive_starlink_pmu/read_miss/
>>            1079750      starfive_starlink_pmu/read_hit/
>>            2089405      starfive_starlink_pmu/release_request/
>>                129      starfive_starlink_pmu/write_hit/
>>                 70      starfive_starlink_pmu/write_miss/
>>                194      starfive_starlink_pmu/write_request/
>>             150080      starfive_starlink_pmu/writeback/
>>            2089423      starfive_starlink_pmu/read_request/
>>
>>       27.062755678 seconds time elapsed
>>
>> Ji Sheng Teoh (4):
>>   perf: starfive: Add StarLink PMU support
>>   dt-bindings: perf: starfive: Add JH8100 StarLink PMU
>>   docs: perf: Add description for StarFive's StarLink PMU
>>   MAINTAINERS: Add entry for StarFive StarLink PMU
>>
>>  Documentation/admin-guide/perf/index.rst      |   1 +
>>  .../perf/starfive_starlink_pmu.rst            |  46 ++
>>  .../perf/starfive,jh8100-starlink-pmu.yaml    |  46 ++
>>  MAINTAINERS                                   |   7 +
>>  drivers/perf/Kconfig                          |   9 +
>>  drivers/perf/Makefile                         |   1 +
>>  drivers/perf/starfive_starlink_pmu.c          | 643 ++++++++++++++++++
>>  7 files changed, 753 insertions(+)
>>  create mode 100644 Documentation/admin-guide/perf/starfive_starlink_pmu.rst
>>  create mode 100644 Documentation/devicetree/bindings/perf/starfive,jh8100-starlink-pmu.yaml
>>  create mode 100644 drivers/perf/starfive_starlink_pmu.c
>
> Palmer, are you ok with me taking this via the perf tree? I usually
> leave the Risc-V stuff for you, but this one doesn't touch the arch code
> at all.

Sorry I missed these

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

> Cheers,
>
> Will

