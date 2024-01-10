Return-Path: <linux-doc+bounces-6454-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A234F828A4E
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 17:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6DE81C249B2
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 16:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02B13A8E2;
	Tue,  9 Jan 2024 16:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cp29K+++"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1943A278
	for <linux-doc@vger.kernel.org>; Tue,  9 Jan 2024 16:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e5280a381so5819375e9.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jan 2024 08:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704818819; x=1705423619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kyb6CN2MTJ0KrepLWGAugAgymHc/HiwDmVkQZF3Jz+E=;
        b=cp29K+++Oy4/Vn7OfXe9ZoO+/1ViLgt5OhQUP915YB0MmAK1WBVPFW6AhCC/L7/nzR
         4DrH5uJh49YpE2xJLlBdrdX+8PFYV6jJo8yr2sARo54wbimFqsiEFDBhipe0xKIPu/1r
         DbNfxo+mk99p4FRTzVnsJPcYZwQcXORK4NNN9Y8gOZpGG3ZaJoM/EOq0PWa+1BrxHpJi
         E/SeH7Sf6R4Avk/roUWRc2zPNBSjL6IrHBKpwVB+hJdElr0EGFP/eoQJLCXp+KBkp8k9
         fyjVoT7bqNIi/ll7WnTFb6hWDiVFaQ6H0GBFdX5WS5FEKstHhA7xn9NdQFlA4GXIKepg
         mgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704818819; x=1705423619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kyb6CN2MTJ0KrepLWGAugAgymHc/HiwDmVkQZF3Jz+E=;
        b=EKZhMxAPN0Zp/QX9wAAn6B6IYdKDxo3P9eRb0new/1mtfGPxtjOmQpxPJLi0qJBTwc
         2SQJDksc2FqgXjYft1kvs/thjDuqjwn/KgG0sGYEo12FrkRELP4CAuqewMCRJZ8lH1N+
         1ecIArQtwnYaj2YOoTgKemqhtUt0V6a+UBvtrBaw8J1DKgh3kPRRPoPv6BUj18hQRcgK
         dQ7SR1Ejyuvy+GsC49EiJbVuB8aLE3snUYuxBx3a9Zw1Cj6VDsR4TzM8XJBXiSQxoZqT
         lugCIIEVvihEufERuGPXe7Mgojk4PpCmlzX2/75JMxv9ZFXXLqo0PQz7Cz4HHBqJhXu8
         9lGA==
X-Gm-Message-State: AOJu0Yzv1lgU/VGY+VIQuCoGW6bCqz5AzWv4LiznE0eV2i3tj5GU3wrK
	STAi/dEmEiljieE//rRglcNpTtbIH94vXQ==
X-Google-Smtp-Source: AGHT+IF9dRAWRS2L2cDEzdxGpgrA4GkSU0CGNenchoR2D4PFYAdKqLE6O0kUT8J5tmPJebBS3lDDGw==
X-Received: by 2002:a05:600c:22d0:b0:40d:8199:c3f with SMTP id 16-20020a05600c22d000b0040d81990c3fmr3183585wmg.153.1704818818906;
        Tue, 09 Jan 2024 08:46:58 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:378:51f6:d46e:8457])
        by smtp.gmail.com with ESMTPSA id r4-20020adff104000000b00336a0c083easm2847845wro.53.2024.01.09.08.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 08:46:58 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	lukasz.luba@arm.com,
	rui.zhang@intel.com,
	mhiramat@kernel.org,
	daniel.lezcano@linaro.org,
	amit.kachhap@gmail.com,
	corbet@lwn.net,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: qyousef@layalina.io,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v4 0/5] Rework system pressure interface to the scheduler
Date: Tue,  9 Jan 2024 17:46:50 +0100
Message-Id: <20240109164655.626085-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following the consolidation and cleanup of CPU capacity in [1], this serie
reworks how the scheduler gets the pressures on CPUs. We need to take into
account all pressures applied by cpufreq on the compute capacity of a CPU
for dozens of ms or more and not only cpufreq cooling device or HW
mitigiations. We split the pressure applied on CPU's capacity in 2 parts:
- one from cpufreq and freq_qos
- one from HW high freq mitigiation.

The next step will be to add a dedicated interface for long standing
capping of the CPU capacity (i.e. for seconds or more) like the
scaling_max_freq of cpufreq sysfs. The latter is already taken into
account by this serie but as a temporary pressure which is not always the
best choice when we know that it will happen for seconds or more.

[1] https://lore.kernel.org/lkml/20231211104855.558096-1-vincent.guittot@linaro.org/

Change since v3:
- Fix uninitialized variables in cpufreq_update_pressure()

Change since v2:
- Rework cpufreq_update_pressure()

Change since v1:
- Use struct cpufreq_policy as parameter of cpufreq_update_pressure()
- Fix typos and comments
- Make sched_thermal_decay_shift boot param as deprecated

Vincent Guittot (5):
  cpufreq: Add a cpufreq pressure feedback for the scheduler
  sched: Take cpufreq feedback into account
  thermal/cpufreq: Remove arch_update_thermal_pressure()
  sched: Rename arch_update_thermal_pressure into
    arch_update_hw_pressure
  sched/pelt: Remove shift of thermal clock

 .../admin-guide/kernel-parameters.txt         |  1 +
 arch/arm/include/asm/topology.h               |  6 +-
 arch/arm64/include/asm/topology.h             |  6 +-
 drivers/base/arch_topology.c                  | 26 ++++----
 drivers/cpufreq/cpufreq.c                     | 36 +++++++++++
 drivers/cpufreq/qcom-cpufreq-hw.c             |  4 +-
 drivers/thermal/cpufreq_cooling.c             |  3 -
 include/linux/arch_topology.h                 |  8 +--
 include/linux/cpufreq.h                       | 10 +++
 include/linux/sched/topology.h                |  8 +--
 .../{thermal_pressure.h => hw_pressure.h}     | 14 ++---
 include/trace/events/sched.h                  |  2 +-
 init/Kconfig                                  | 12 ++--
 kernel/sched/core.c                           |  8 +--
 kernel/sched/fair.c                           | 63 +++++++++----------
 kernel/sched/pelt.c                           | 18 +++---
 kernel/sched/pelt.h                           | 16 ++---
 kernel/sched/sched.h                          | 22 +------
 18 files changed, 144 insertions(+), 119 deletions(-)
 rename include/trace/events/{thermal_pressure.h => hw_pressure.h} (55%)

-- 
2.34.1


