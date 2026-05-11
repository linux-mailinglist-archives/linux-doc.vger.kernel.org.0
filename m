Return-Path: <linux-doc+bounces-86848-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOKmAAHgAWptlgEAu9opvQ
	(envelope-from <linux-doc+bounces-86848-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 15:56:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F09350F71E
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 15:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BAA553010651
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 13:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF0E3F7AB5;
	Mon, 11 May 2026 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BYhtBlAf"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD333BFE33;
	Mon, 11 May 2026 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507760; cv=none; b=qsW6KsAO4Yy4Hw9HI5zrynVH1v8Ow++3Ej5QXLcTRWTLjM96TBkfdTYpREPFrawlLrBNSoefAPmFnpcVe5A/Kocjp7qT8MQGi+azlbjZWnR31xpNlmw3FFskgQL2GHszV9lApFQviU1tPYCGvzO2DEuvir7AFgdsdqrbf8ceI5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507760; c=relaxed/simple;
	bh=tLjsS8snRKgNQ1oRnQ5Dl55EGHmV44bCAQASdTaY2dA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0IVIDBkcp2TWdr2iKD/1tQgpJtCxI3s448dqmdB+Xcy/zU8LnI+2UoBKDKLP8CqH9xKGuHTtsONRmbEhge2jLx+PMZDcL7hU7NyFxxyNAmM3lX9l7edlxRXMhzdnE+kyc1EJq9ZWtgDbibZQJcXYCmpjv1GevXs9Mo4SW5AjlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BYhtBlAf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 136F616F3;
	Mon, 11 May 2026 06:55:50 -0700 (PDT)
Received: from e135073.arm.com (unknown [10.57.34.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06C0B3F85F;
	Mon, 11 May 2026 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778507755; bh=tLjsS8snRKgNQ1oRnQ5Dl55EGHmV44bCAQASdTaY2dA=;
	h=From:To:Cc:Subject:Date:From;
	b=BYhtBlAf9rXV1MQXnIgP2r1PIuIVz0Xe/qHW1Ig1xh/UFKux/fcPsHWmSAUSs2iLv
	 mlF1hMxPEvfl4qw63vaxGTuK/WyuKsAlz2d9X0UtP3PIXHVj4emGe9vnDxQuFWl0p3
	 db72m8kUr6T1D0gQbWuM4Ot1ZsR241du/a989etg=
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Jie Zhan <zhanjie9@hisilicon.com>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Huang Rui <ray.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 0/4] cpufreq: Set policy->min and max as real QoS constraints
Date: Mon, 11 May 2026 15:55:27 +0200
Message-ID: <20260511135538.522653-1-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7F09350F71E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86848-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_NEQ_ENVFROM(0.00)[pierre.gondois@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

This patch is a follow-up from the serie:
- [PATCH v6 0/4] cpufreq: Introduce boost frequency QoS
https://lore.kernel.org/lkml/20260317101753.2284763-1-pierre.gondois@arm.com/

v2:
- Split the patch in multiple steps
- Replace min/max -> min_freq/max_freq
- Add references to commit 521223d8b3ec ("cpufreq: Fix initialization
  of min and max frequency QoS requests") to explain the intent
  of the patch
- Update documentation (cpu-drivers.rst)
- Set default policy->min/max values before the call to
  blocking_notifier_call_chain()
- Create a new cpufreq_policy_init_qos() function to put all
  the QoS and policy->min/max logic inside.
- Didn't add Sumit's reviewed-by as the patches changed a bit.
v1:
https://lore.kernel.org/lkml/20260423084731.1090384-1-pierre.gondois@arm.com/#t

Pierre Gondois (4):
  cpufreq: Extract cpufreq_policy_init_qos() function
  cpufreq: Set default policy->min/max values for all drivers
  cpufreq: Remove driver default policy->min/max init
  cpufreq: Use policy->min/max init as QoS request

 Documentation/cpu-freq/cpu-drivers.rst | 10 +++-
 drivers/cpufreq/amd-pstate.c           | 14 +++---
 drivers/cpufreq/cppc_cpufreq.c         |  5 +-
 drivers/cpufreq/cpufreq-nforce2.c      |  4 +-
 drivers/cpufreq/cpufreq.c              | 68 ++++++++++++++++++--------
 drivers/cpufreq/freq_table.c           |  7 ++-
 drivers/cpufreq/gx-suspmod.c           |  2 +-
 drivers/cpufreq/intel_pstate.c         |  3 --
 drivers/cpufreq/pcc-cpufreq.c          | 10 ++--
 drivers/cpufreq/pxa3xx-cpufreq.c       |  5 +-
 drivers/cpufreq/sh-cpufreq.c           |  6 +--
 drivers/cpufreq/virtual-cpufreq.c      |  5 +-
 12 files changed, 78 insertions(+), 61 deletions(-)

--
2.43.0

