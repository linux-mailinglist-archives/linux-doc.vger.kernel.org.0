Return-Path: <linux-doc+bounces-92822-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oqOFGxaANGr6ZgYAu9opvQ
	(envelope-from <linux-doc+bounces-92822-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 01:32:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BED6A3170
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 01:32:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=iIbBeGKA;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92822-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92822-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2840B302675E
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 23:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170533446AD;
	Thu, 18 Jun 2026 23:32:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f202.google.com (mail-oi1-f202.google.com [209.85.167.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AE22EC57C
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 23:32:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781825554; cv=none; b=fxBq/Y9y4hoLryBIKQbpmBXgq2HC7ENsMfRvbgTuG/eS+spqRZ6EKAHwQIValYJRuCX31D6fWYOpJX7XS45rfFqVKBQ3XMHzVKE5XEo4GpHSTGpw26DXJIjLypCJ8NwnwsMbwEV3hW7KKxI9/K4FkKElBFqNHY+NeZ5xanFP16s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781825554; c=relaxed/simple;
	bh=aOBaHP4DOk4vq3tW3rv9yXUlZFd1+xiTupwDlFmXHKA=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=dxQ7KNgE7g2hlDLeN/f8D95zOJD6HFvKIUbYbURRsyChYUNU1ODi2uwNtGwB1vZ1s53zDqsRqqJYpW+zB6BNQENDJDka4Yw3aQHuA/hj3RqSiMzFwHxntBKsbjETSHyBDg45wkuB9IYW/Olc4WkKNKIb1RogeNdoW2iBw52ZSY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iIbBeGKA; arc=none smtp.client-ip=209.85.167.202
Received: by mail-oi1-f202.google.com with SMTP id 5614622812f47-486e64c8edeso2083953b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 16:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781825552; x=1782430352; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cwWYCnxdR0CMlBSotsz1RrmN4O2SDrdrRioZC+xeVso=;
        b=iIbBeGKAiRPB/YS1s9Oxi9L0oJrB9PN4tcvDyNcyEHh2gMo04HY4O/S8d9I17GBaiL
         jOnq5tpDfWcB7mmRXo/w8BQB0rC2ZarKIr55zQ8wwaWcS4P1t7SwSa4/jJPjNgiyU/C8
         4EGaGPyLqA1RRcd/hrWwrCYkyJk+4B9AjU9T8utLbAqSn0agyfqEeCtm+DrbpF+mjg1h
         qlY+Q/e1epyuca6ImMUQVk8mBSHym0iEGD+TkJwq9YG2n27TjyE1oOT8XUqM33WiFLAY
         1U6cHnbugFtIQIBCHb69XVpK5Ozl+AFpMzeYVSDMi59Le3/wCpXGzzWeefGtbDx9BRi9
         KcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781825552; x=1782430352;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwWYCnxdR0CMlBSotsz1RrmN4O2SDrdrRioZC+xeVso=;
        b=ZYcI1/VR/Z99KSY5wpl47Mswv69O0RQo0n+cmoxFmGAly2TcdJsr1gMmV6Nug40bmX
         cLEd/xzC04YYTDQpuxsdgjtXRqXr8L59PFhz36Kswt22USEM3pcnEWt6+NznSur7KHSt
         CgIvml85YLzJKKboUJL9/XYkFyQC7cUQvUfGXxjyU+YrNhZUxy45b5Pdi46wnJSUa9Wy
         GNGSV4MmqHj2nCku5zQRwfE2EZKTWW+BN/ukshO4lezqlU0JZ8O3ian+W6/pJBjZO7GO
         5L+53VnIaJWLhbKLITB/mfrZ667QkKOLrkzxf3QNSFQclDFFWJ97ZP1eulMxyYLqMyR0
         1BUw==
X-Forwarded-Encrypted: i=1; AFNElJ+OBHmFFS5rNu3e4xdY0ECzLt77y6iueeiWHlEJ3KsVI0DNgq0jtF0SHco4jAsTY6MGsd7Txd4CYF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBfvYuzDP5FvZL49dw4RK7xzoF5jDM7AnvSVQUMjNZUkPT7Bxl
	iv6hOsO3jci7O183f15ExMua5aG1ah8kw8JzCRrpRd7ztBeyaleMBjhZnsGxKGtc2dy/tzOqgNj
	EmPbK4EEey/IBoGqQYjnnspeijg==
X-Received: from ilbdv1-n1.prod.google.com ([2002:a05:6e02:4001:10b0:502:e73:d02b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1808:b0:46c:e542:cc25 with SMTP id 5614622812f47-489aeaa5634mr180520b6e.9.1781825551504;
 Thu, 18 Jun 2026 16:32:31 -0700 (PDT)
Date: Thu, 18 Jun 2026 23:32:30 +0000
In-Reply-To: <6dca2d6e-54d0-42c4-95df-45a30a473e0b@huawei.com> (message from
 wuyifan on Thu, 18 Jun 2026 09:53:15 +0800)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntse6jctm9.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 15/20] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
From: Colton Lewis <coltonlewis@google.com>
To: wuyifan <wuyifan50@huawei.com>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	james.clark@linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, wangyushan12@huawei.com, 
	wangzhou1@hisilicon.com, xuwei5@huawei.com, prime.zeng@hisilicon.com, 
	fanghao11@huawei.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wuyifan50@huawei.com,m:kvm@vger.kernel.org,m:alexandru.elisei@arm.com,m:pbonzini@redhat.com,m:corbet@lwn.net,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maz@kernel.org,m:oliver.upton@linux.dev,m:mizhang@google.com,m:joey.gouly@arm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:mark.rutland@arm.com,m:shuah@kernel.org,m:gankulkarni@os.amperecomputing.com,m:james.clark@linaro.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:wangyushan12@huawei.com,m:wangzhou1@hisilicon.com,m:xuwei5@huawei.com,m:prime.zeng@hisilicon.com,m:fanghao11@huawei.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[coltonlewis@google.com,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-92822-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coltonlewis@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,coltonlewis-kvm.c.googlers.com:mid,huawei.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5BED6A3170

wuyifan <wuyifan50@huawei.com> writes:

> Hi Colton,

> On 5/5/2026 5:18 AM, Colton Lewis wrote:
>>    static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
>>    {
>> -	u64 pmovsr;
>>    	struct perf_sample_data data;
>>    	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
>>    	struct pt_regs *regs;
>> +	u64 host_set = kvm_pmu_host_counter_mask(cpu_pmu);
>> +	u64 pmovsr;
> kvm_pmu_host_counter_mask() is called from armv8pmu_handle_irq(). This
> interrupt fires in both host and guest contexts.

> However, kvm_pmu_host_counter_mask() dereferences
> host_data_ptr(nr_event_counters). This indirection requires
> kvm_arm_hyp_percpu_base[cpu] to be initialized, which only happens during
> KVM hypervisor setup. When the interrupt fires in a guest kernel where
> KVM is
> compiled but not active, the per-CPU base is NULL and the dereference
> faults.

I will fix that.


> Thanks,
> Yifan

