Return-Path: <linux-doc+bounces-20269-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B653592B4A8
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jul 2024 12:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D96CB1C22795
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jul 2024 10:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01DD155CA3;
	Tue,  9 Jul 2024 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QkMN0IEp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E5F12E1F1
	for <linux-doc@vger.kernel.org>; Tue,  9 Jul 2024 10:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720519436; cv=none; b=MpZdVsXxG7oL9airXmmJORFdxulyJsOHFKijtXBJJAERWSHJxJ7d6nX6KXRQKTaUiGoe72Ae97nswStUhPrRKyV+GkAme3nHwZxFQppuqA6HQv1ORwfxAGXHh/bJ7DZz/g6FSOTTQwSXplyimDKUdLMnhSDNlK35MAGQdW3LRRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720519436; c=relaxed/simple;
	bh=pfWeRQ9z63xXUzwl68xoKfmthMSvSUY0TsePVfQ6Sz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WpqELkSPGYiVDsZEX//CgdM4nFtqPMMhiwYy2GeXRyegvyGFudnTFAEIVh0LHgJuqgmRtPV50ZUNsLSP84Zv93lO6JtSLA2dLC9jiuufQczIO9SMgI43/4m4uEYTvTU21BQSCiGH8tYoGDdsfSONaBErzXDWpkIWCjkFc8mT1M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QkMN0IEp; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c9d161affbso1656237a91.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jul 2024 03:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720519434; x=1721124234; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6VJWwLEBYOh8xzQaO4F0YcqWYlZ7zC32Ge3nPh9wVd4=;
        b=QkMN0IEp4np2Tp6yEBeGYXdT/4fBIePdh/US4cdtLBHilvrVjtqbo045mKcmcjmonQ
         YUj125qRiqye/g0EEi+uE9kAwAgr2Dqh8FVcZEy3I38Wx/KCCe2z32YJu6FAabW5rEdg
         gaKFT6aH6xYt0gJ1OPP5GQ/3CdTnb2k/8PfziAAoko6xRDwVmhZ8mW/UNDEbJmtg60R0
         wgr1jRgzT/V0d6gy80mu3uS4ylGnujlvXEaXhobVVwhj2D4iy25P5pgJ6WhYCEq6CYOZ
         JGfuF/nvA/BZ4Ah+b5GRDqkv7HDAC4iiOmJcotMp3+qaZPMJR49Sm4uA4Ka5O2/ipigs
         9YhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720519434; x=1721124234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VJWwLEBYOh8xzQaO4F0YcqWYlZ7zC32Ge3nPh9wVd4=;
        b=Bc0J98qViOLJ2u3C6FIBMyQluiLnRJ+wzFwwTpfQiqJj76mreV6fFk+B4dVEbe9v86
         U5tm8aVOmMiv4qZWeXEiMDGe9MQtdS4h+2KVSb0o5qul/TgDricMUE6D2hV85B3w/Wyc
         XUKORqaaVckB5uADNlJXTx+Draba2yObDWCzOaky2iWEhZI/mJNaQgu8Lc6GNsjNuAX1
         ZHwk676/b+O6L2pJ6HmXBgSu7Zg/fug+yagRBzl92/RZr+o6PNjot8EBhJdLdiVLJjaj
         nBzEvH0zsto3uw373Qinq0wmk44zcGzNnLhJpVShicjThm8WIkKNlMhDr/Z3QWLm8DxU
         3RFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrvW/evmhxD44hyNxI6iOaTparKZsdVv0LPv0b/mM9n9lkADDPSv2lY1D+IvO7UAkQCf9eE3SX8G8EU7MNVoIkc8e5Bs0l7ULo
X-Gm-Message-State: AOJu0YxoKZvxkRuncvquEVBLGxU1RDsGDGLpUbxJ6KYhrgp+P6yd0Mhn
	3QQWe+KbPnHhyvajD0WtFKRBy9umczB4LYsRZN5fve7xRsRcyx8wUjo7CY+FBkykY1vu1ltxI9e
	kRn403E56w7S7HdeqHUUaeDrqqb+HirvBFzT0EQ==
X-Google-Smtp-Source: AGHT+IH6N7ahlaBsr4KPKwt7WQks8di0GBh2UIN+q2pZe8ruW+aeLRFepm/Osqh25kkPLPTml7o0GZkHEA5hSa5uKBA=
X-Received: by 2002:a17:90b:2284:b0:2c8:647:1600 with SMTP id
 98e67ed59e1d1-2ca35bde67bmr1826628a91.9.1720519434459; Tue, 09 Jul 2024
 03:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202407091527.bb0be229-lkp@intel.com>
In-Reply-To: <202407091527.bb0be229-lkp@intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 9 Jul 2024 12:03:42 +0200
Message-ID: <CAKfTPtBMdLRN8WVUmvXXZQK5fE_rZEFJenujrxpqWYAQ7b-jBw@mail.gmail.com>
Subject: Re: [linus:master] [sched/pelt] 97450eb909: INFO:task_blocked_for_more_than#seconds
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Qais Yousef <qyousef@layalina.io>, linux-doc@vger.kernel.org, aubrey.li@linux.intel.com, 
	yu.c.chen@intel.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jul 2024 at 09:22, kernel test robot <oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "INFO:task_blocked_for_more_than#seconds" on:
>
> commit: 97450eb909658573dcacc1063b06d3d08642c0c1 ("sched/pelt: Remove shift of thermal clock")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

First, I'm surprised that an Intel platform is impacted by this patch
because Intel doesn't use it AFAIK.
Then, this patch mainly remove a right shift i.e.:
instead of:
  return rq_clock_task(rq) >> sched_hw_decay_shift
we are now doing:
  return rq_clock_task(rq)

Could it be a false positive ?


>
> [test failed on linus/master      22f902dfc51eb3602ff9b505ac3980f6ff77b1df]
> [test failed on linux-next/master 0b58e108042b0ed28a71cd7edf5175999955b233]
>
> in testcase: rcutorture
> version:
> with following parameters:
>
>         runtime: 300s
>         test: cpuhotplug
>         torture_type: tasks
>
>
>
> compiler: gcc-13
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> we noticed the issue is random, 86 times out of 500 runs as below, while
> keeping clean on parent.
>
>
> d4dbc991714eefcb 97450eb909658573dcacc1063b0
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :500         17%          86:500   dmesg.INFO:task_blocked_for_more_than#seconds
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202407091527.bb0be229-lkp@intel.com
>
>
> [  996.963402][   T17] INFO: task swapper:1 blocked for more than 491 seconds.
> [  996.973637][   T17]       Tainted: G        W          6.9.0-rc1-00051-g97450eb90965 #1
> [  996.983009][   T17] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  996.992369][   T17] task:swapper         state:D stack:5680  pid:1     tgid:1     ppid:0      flags:0x00004000
> [  997.003585][   T17] Call Trace:
> [ 997.022071][ T17] __schedule (kernel/sched/core.c:5412 kernel/sched/core.c:6746)
> [ 997.032795][ T17] ? schedule (kernel/sched/core.c:6804 kernel/sched/core.c:6837)
> [ 997.051350][ T17] schedule (arch/x86/include/asm/preempt.h:84 (discriminator 13) kernel/sched/core.c:6824 (discriminator 13) kernel/sched/core.c:6838 (discriminator 13))
> [ 997.061394][ T17] async_synchronize_cookie_domain (kernel/async.c:317 (discriminator 9) kernel/async.c:310 (discriminator 9))
> [ 997.071656][ T17] ? add_wait_queue (kernel/sched/wait.c:383)
> [ 997.084201][ T17] wait_for_initramfs (init/initramfs.c:757)
> [ 997.093158][ T17] ? do_header (init/initramfs.c:761)
> [ 997.104204][ T17] populate_rootfs (init/initramfs.c:768)
> [ 997.113736][ T17] do_one_initcall (init/main.c:1238)
> [ 997.122668][ T17] ? parameq (kernel/params.c:90 (discriminator 1) kernel/params.c:99 (discriminator 1))
> [ 997.133272][ T17] ? rdinit_setup (init/main.c:1286)
> [ 997.142176][ T17] ? parse_args (kernel/params.c:142 (discriminator 1) kernel/params.c:186 (discriminator 1))
> [ 997.172210][ T17] ? do_initcalls (init/main.c:1298 init/main.c:1316)
> [ 997.183570][ T17] do_initcalls (init/main.c:1299 (discriminator 1) init/main.c:1316 (discriminator 1))
> [ 997.194241][ T17] ? rest_init (init/main.c:1429)
> [ 997.204290][ T17] kernel_init_freeable (init/main.c:1552)
> [ 997.214432][ T17] kernel_init (init/main.c:1439)
> [ 997.223979][ T17] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 997.232870][ T17] ? rest_init (init/main.c:1429)
> [ 997.244227][ T17] ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
> [ 997.254412][ T17] entry_INT80_32 (arch/x86/entry/entry_32.S:944)
> [  997.831274][   T17]
> [  997.831274][   T17] Showing all locks held in the system:
> [  997.840770][   T17] 4 locks held by kworker/u4:1/16:
> [  997.844292][   T17] 1 lock held by khungtaskd/17:
> [ 997.853205][ T17] #0: c26e50c8 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks (kernel/locking/lockdep.c:6612)
> [  997.880625][   T17]
> [  997.883881][   T17] =============================================
> [  997.883881][   T17]
> BUG: kernel hang in boot stage
>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240709/202407091527.bb0be229-lkp@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

