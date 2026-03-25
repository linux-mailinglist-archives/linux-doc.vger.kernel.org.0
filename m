Return-Path: <linux-doc+bounces-81121-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDlDAhRKw2lnpwQAu9opvQ
	(envelope-from <linux-doc+bounces-81121-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 03:36:04 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD4F31EBCF
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 03:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F9EE305D6F1
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 02:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BC1286D53;
	Wed, 25 Mar 2026 02:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EurudgTY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090582853E0
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 02:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406144; cv=none; b=VHECGbk86cAryJpegjpo+iya614/tBCowU3UPPqUGPWbgGRkciXFnFMJtsCJyg5EJoewVmXiZCUb8JJA5wnOQ7+7kZVK9u14S6XSlfmBeH+eBZxVJbc3xenN6XhX7fUzhf1GUBYyaW4XKJxcHcYNtFg/FW1ddQaTIukySkOAEBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406144; c=relaxed/simple;
	bh=ubJF9m/wLx7bYWwOAm7o0d8tY4ejMPWhdFfkGi74I9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAQhUrSGGTgV49qqGFTV0KSO5M3t3AfDbPQAVXJat4pxKwZW/nYPeAZw70H8L9NQAP+PRuFdTmz3daA8YWUWlAT0J4Qf50Ml+yRkvqaeQmO7jOIgdW3qV0/ukCxRyfKkFOJoIu3xskwQ5UV8xW8zPSQF5b72vAfM8seh0oiXuCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EurudgTY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b40003d13so3824483f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 19:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774406141; x=1775010941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/WqiqBCLyiLY/v28qTyeW3QcaRTjQUhA8ri92uqPms=;
        b=EurudgTYj3bgYiWZTc/rEzyiUkWBbjOsAiiT89wURxO/FYynIbN13FcNHNxXUEpLH5
         /Hb3dxM9wI3LWT6fQ5036QJudRU29qe+LzX3WYY+DrnqYjm50GmyAGBog6ncaWRbumnQ
         j9Hw5HpXl5ug1Ipp+IKmtX/y9qy9vtWQbd286QzAADbonJ2P5qDII+qKVzKMvGwhErgI
         A4RwRjBShlN9WqEX1FNtyhvyq2k6x3DhqPez5rTFgr+EWTs1wEJ7zzb/xtyZKALiPudX
         +JX6EGkr84JxVMtmzypATXAPr5qWwTj6xgiW2sFrJCMJ3WkV0VqlYIFSxQ7AyLWkrz6F
         n9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774406141; x=1775010941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e/WqiqBCLyiLY/v28qTyeW3QcaRTjQUhA8ri92uqPms=;
        b=qu2dnDgBoGEZk4UPWknQzvYBsJNpvvgWJo+Bl4WqW9vRpp6qWxLFMcZ2Z3H6Vc1eoz
         U8S863EJ2HyDo5hxZJUShWm4Y4m+JK7JtoZ+mgWvFotqtKD+QFGWOu3LDPVEJKtfAegb
         5iBQcTHwFQ+WZcK8YR7OWoJ+5HpuL2TjwsBdcdN0ED2K+rybfsBNXE5WvoyIYjVBSVtX
         PV1IWsowkRVmV8/u0eJ4rz36B0+SHLEbZ8zXy/trElEGiyvhauZ2zZCPtLwsaRx9LIac
         fsl+sYZo+Yioh7//3NdXj60P+UawNk9FwpAwUqdDJ7+21n33YwUA+fA6h+EIAKmfybtf
         wYoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8/8yEwmJl8y0+BZ1zPzsWZtkOnR9ZfRqRE7xDbHSXB8CKDJkDQowVlq1h+R85xjUz4Sq9w1OmmBY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0rBJPYA/teFFmz66Y/8qAo9OBmKF3O/OysWJ5w3Ql8xWiUZm5
	ewyUsYCB2Js0fiNu34TLhGQ8s/yNCGS97HZ8ugxZtxRq32CTs6IYXq0v
X-Gm-Gg: ATEYQzwJys6CZQ3myfMUG0F0Lbglmc+AtXtc4FkFhyIKkuTs22Nlraz0QOcui741oHF
	4R17bTTzG+o6wOloqWpgRLY4NKSkpOEsvERzMl2jEmO7800ddJU3ny06+ROs3ujBfH7A4CDQ7YV
	44T7ySGR044oXzGTA/+0YGh0+qMqzW4KOJsQa/zmAwNC4LsMFZLtJ25BOSbYIqy5ZhrNY0FtDfp
	eq8gHtuHIk2dl1192MoJiNyOtSfUZJyvzewY6WPAL95BaYS1QJnMW6lRpzpazk8hmlf0uXr102a
	qjplAA/f6ov6kif4dCXnqrlmlbRWMA3nNhyS61iyeeICs86Z9ZGuxITwnieIwDD6gVi1ENlG0MZ
	oO9LFt6Oz2V0g15IOkuMGKg9142thhfMAO6fJ6lEs+7SUBJObQGr8HFTFhACUhF+CJ3MHczgHfQ
	L6p6GkrAnRn4BOx1dvWEaQ57MAWSZ2YQ==
X-Received: by 2002:a05:6000:18a8:b0:439:b440:b8a2 with SMTP id ffacd0b85a97d-43b88a0d156mr2181278f8f.28.1774406141184;
        Tue, 24 Mar 2026 19:35:41 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43b6470f902sm45426571f8f.28.2026.03.24.19.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 19:35:40 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: nphamcs@gmail.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	apopple@nvidia.com,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	bhe@redhat.com,
	byungchul@sk.com,
	cgroups@vger.kernel.org,
	chengming.zhou@linux.dev,
	chrisl@kernel.org,
	corbet@lwn.net,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jannh@google.com,
	joshua.hahnjy@gmail.com,
	kasong@tencent.com,
	kernel-team@meta.com,
	lance.yang@linux.dev,
	lenb@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pm@vger.kernel.org,
	lorenzo.stoakes@oracle.com,
	matthew.brost@intel.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	npache@redhat.com,
	pavel@kernel.org,
	peterx@redhat.com,
	peterz@infradead.org,
	pfalcato@suse.de,
	rafael@kernel.org,
	rakie.kim@sk.com,
	riel@surriel.com,
	roman.gushchin@linux.dev,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	tglx@kernel.org,
	vbabka@suse.cz,
	weixugc@google.com,
	willy@infradead.org,
	ying.huang@linux.alibaba.com,
	yosry.ahmed@linux.dev,
	yuanchu@google.com,
	zhengqi.arch@bytedance.com,
	ziy@nvidia.com
Subject: Re: [PATCH v5 00/21] Virtual Swap Space
Date: Wed, 25 Mar 2026 05:35:30 +0300
Message-ID: <20260325023530.222944-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAKEwX=MgoPmiFdBQXK_4=XuR-8mVpGr+3Ku2MfjPmHCeuUdGJg@mail.gmail.com>
References: <CAKEwX=MgoPmiFdBQXK_4=XuR-8mVpGr+3Ku2MfjPmHCeuUdGJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[oracle.com,linux-foundation.org,nvidia.com,google.com,kernel.org,linux.alibaba.com,redhat.com,sk.com,vger.kernel.org,linux.dev,lwn.net,arm.com,gourry.net,cmpxchg.org,gmail.com,tencent.com,meta.com,kvack.org,intel.com,suse.com,infradead.org,suse.de,surriel.com,huaweicloud.com,suse.cz,bytedance.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-81121-lists,linux-doc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[safinaskar@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_GT_50(0.00)[56];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6DD4F31EBCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Nhat Pham <nphamcs@gmail.com>:
> I'm aware of that work. It's an improvement, but my understanding is:

Thank you for answer!

Also, is it possible to have checksummed swap?

I want to have checksummed swap to be protected from disk bit-rot
(I already have ECC memory, so RAM is protected).

And hibernation image should be protected, too.

I tried to put swap on top of dm-integrity, but this is
incompatible with hibernation in mainline kernel.

-- 
Askar Safin

