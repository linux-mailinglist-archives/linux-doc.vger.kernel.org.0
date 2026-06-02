Return-Path: <linux-doc+bounces-90567-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N/HhEtJLH2oYjwAAu9opvQ
	(envelope-from <linux-doc+bounces-90567-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 23:32:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B59EE632190
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 23:32:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CgnzSV6e;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90567-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90567-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9AA5305749E
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 21:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF65B39EF35;
	Tue,  2 Jun 2026 21:26:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A63239C621
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 21:26:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780435604; cv=none; b=HesqtIks+GlzabkbLdKdL0jE3yvvh8E+Rbbls1akVQAZ59tXzKyBHn0nzzTuywOYtgF/0Y2GNRcvFIxexqArenO+/nf3kIpzcZwRMq5X6pRx1UAOFmScpkfWXRS3S2zaypM3hAmPc3aQDxX6vTEuqMTTC50jxlu3w8GX6eV1kdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780435604; c=relaxed/simple;
	bh=dXfphc9xwtT9J9Mx9nqk/TREcXFO8JL1ydyTeyM2RLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISEgOeAg5Rf4jQdDfCgYWqrLEm559Hyi0uqXaUNKVYIEWVc9dj+vwPRF4O2l0r6fGFp5nW0hpaf5LlSJJEVkhGXRVylbE8QnDn9uflr/RfX5/vWN0gxBXTJtccotF1X5iSvv0QpPbiadiLfkovDNSaLSghRADIvPxOW2eHxImBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgnzSV6e; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so3656199f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 14:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780435601; x=1781040401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7X+F9JE3lvSde2aXKa2nn0C2FzfJE3VdMHUXsv8Plio=;
        b=CgnzSV6esF+1TCJsKAi+5U7iGvsASgdRpAR7RUZ0iAZWg6Ry8JXDzzhHDg4R43PrUP
         4+PRNws27ToP9i6eKFlE0keA6Rl18gc6LqFlh1Jv+kOg+Z9JfdnT0KgKbtF9qaPcmv7C
         XPjz1Ak3aVKiQiHXG+7Yew35qijmalM30gi1T8QSdVMbxlJFX8PJA4Cf7N2gPLDKM7yL
         q7FpeX6gBV5F76UOf1YF4AO+8nbUYQauoE6ky0H5zqB761ek8tBDF//qLoQo3aqImhVc
         2uhPM4plPECUokU0erjQXYaWI+HHyx/K9gKuvAP+VogI8EnLeoNjMXEKuV/pbSnv207G
         FPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780435601; x=1781040401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7X+F9JE3lvSde2aXKa2nn0C2FzfJE3VdMHUXsv8Plio=;
        b=AKthtBMxLpWk1uAq1MSc71gULpifa9TYiFh+zqWH4G/KJnKWTqUsB+NuYU/IfZJQ87
         n0X8eeKRp5rZAWO1nP46Qd7ozpda+YYNmAoS15jLVq0xUlpBhLPiCPlw9W3d5pQv/Pgf
         LoNKuL5x/Cd8dgvF5wJXboub+d3Mt18vL27EGynBMgVG3PdifBZJfaZGGquUJcf9zVy8
         hkUpnKLUw/77oaxbnw424ppguL6tFnFbUA0xJill3+KPuFgqAIsUWttP5ScYlbWDTJGv
         f8Untri+gNkqzjHOf8aDXJluaRjhRldkjHSZQ3qv82cSDqafKnW4fAT0lghZ5k6cvw0h
         hn3w==
X-Forwarded-Encrypted: i=1; AFNElJ/yJLYuKlBE8pVt5QAY/AUK6wrTvybMNI4SaNmpuGw5j0b4wHAMXpg9gbmgmpB6WUyUXXArHMQkxAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeWR2k7GnKFDpvcLi6Pv1Kox8OwC7QdCAyOun8mWoVKCBw5gwZ
	fiIVEbs2VypawzEFGwL3qeMs2jrxAgkyI/RqRWEJxPjcEEkr5bSmw4bT
X-Gm-Gg: Acq92OFo653uINTnl2j3A/FNI0p+zI795WJk9RRjxSWhKZJQlOpJCAOMlt4eNm8oZuh
	QIk3HtzTUnqaB8a36vvKKod/fWX2KukHnc+0t7CsKTtJjMBIwZh59HVNQVRJZfwhd+FGEYhNzpP
	jcP9pJ1pfOCnLlalTIfh/a1KJ8GFRU/YYVhF+hJpcHOoSGOME1IJ/xyxg9C/J0n+Mgp13BscMk3
	z5qqH0olApx5jXCJaaajIaYtxVAZYX8vrRHag5HJosgykuI/EwR+3wYbKf7aaV/ZI81gALheYAk
	/5Q2G0zJctVJXuQ0Erta1Cx0bugpSNYQetHK0y0uNkKuzoFijOx0zNK4/WPuki+SBCnWctxBjnI
	j8JQpFs8P8+yYN7QJyh0+pJJrhI1jWS/WvtETk8AxOXFE61a+DGpO0WLmkNnWXjYYzcqHYYbifF
	yi5i9+qJX+B1v/Pk1mQ70b686gG5w1vA==
X-Received: by 2002:a05:600c:c174:b0:490:b2a6:8c2b with SMTP id 5b1f17b1804b1-490b5eb82b2mr8862715e9.10.1780435601484;
        Tue, 02 Jun 2026 14:26:41 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490b614261bsm2203845e9.26.2026.06.02.14.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 14:26:41 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: devnull+ackerleytng.google.com@kernel.org
Cc: ackerleytng@google.com,
	aik@amd.com,
	akpm@linux-foundation.org,
	andrew.jones@linux.dev,
	aneesh.kumar@kernel.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	bhe@redhat.com,
	binbin.wu@linux.intel.com,
	bp@alien8.de,
	brauner@kernel.org,
	chao.p.peng@linux.intel.com,
	chrisl@kernel.org,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	david@kernel.org,
	forkloop@google.com,
	hpa@zytor.com,
	ira.weiny@intel.com,
	jgg@ziepe.ca,
	jmattson@google.com,
	jthoughton@google.com,
	kas@kernel.org,
	kasong@tencent.com,
	kvm@vger.kernel.org,
	liam@infradead.org,
	linux-coco@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com,
	mhiramat@kernel.org,
	michael.roth@amd.com,
	mingo@redhat.com,
	nphamcs@gmail.com,
	oupton@kernel.org,
	pankaj.gupta@amd.com,
	pbonzini@redhat.com,
	pratyush@kernel.org,
	qi.zheng@linux.dev,
	qperret@google.com,
	rick.p.edgecombe@intel.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	seanjc@google.com,
	shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com,
	shivankg@amd.com,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	tabba@google.com,
	tglx@kernel.org,
	vannapurve@google.com,
	vbabka@kernel.org,
	weixugc@google.com,
	willy@infradead.org,
	wyihan@google.com,
	x86@kernel.org,
	yan.y.zhao@intel.com,
	youngjun.park@lge.com,
	yuanchu@google.com
Subject: Re: [PATCH v7 34/42] KVM: selftests: Test conversion with elevated page refcount
Date: Wed,  3 Jun 2026 00:26:30 +0300
Message-ID: <20260602212630.27012-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522-gmem-inplace-conversion-v7-34-2f0fae496530@google.com>
References: <20260522-gmem-inplace-conversion-v7-34-2f0fae496530@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,amd.com,linux-foundation.org,linux.dev,kernel.org,redhat.com,linux.intel.com,alien8.de,lwn.net,zytor.com,intel.com,ziepe.ca,tencent.com,vger.kernel.org,infradead.org,lists.linux.dev,kvack.org,efficios.com,gmail.com,goodmis.org,huaweicloud.com,linuxfoundation.org,arm.com,lge.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[safinaskar@gmail.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-90567-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devnull+ackerleytng.google.com@kernel.org,m:ackerleytng@google.com,m:aik@amd.com,m:akpm@linux-foundation.org,m:andrew.jones@linux.dev,m:aneesh.kumar@kernel.org,m:axelrasmussen@google.com,m:baohua@kernel.org,m:bhe@redhat.com,m:binbin.wu@linux.intel.com,m:bp@alien8.de,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:chrisl@kernel.org,m:corbet@lwn.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:forkloop@google.com,m:hpa@zytor.com,m:ira.weiny@intel.com,m:jgg@ziepe.ca,m:jmattson@google.com,m:jthoughton@google.com,m:kas@kernel.org,m:kasong@tencent.com,m:kvm@vger.kernel.org,m:liam@infradead.org,m:linux-coco@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:mathieu.desnoyers@efficios.com,m:mhiramat@kernel.org,m:michael.roth@amd.com,m:mingo@redhat.com,m:nphamcs@gmail.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:pbonzini@redhat.com,m:p
 ratyush@kernel.org,m:qi.zheng@linux.dev,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:rostedt@goodmis.org,m:seanjc@google.com,m:shakeel.butt@linux.dev,m:shikemeng@huaweicloud.com,m:shivankg@amd.com,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:steven.price@arm.com,m:suzuki.poulose@arm.com,m:tabba@google.com,m:tglx@kernel.org,m:vannapurve@google.com,m:vbabka@kernel.org,m:weixugc@google.com,m:willy@infradead.org,m:wyihan@google.com,m:x86@kernel.org,m:yan.y.zhao@intel.com,m:youngjun.park@lge.com,m:yuanchu@google.com,m:devnull@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[safinaskar@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_GT_50(0.00)[66];
	TAGGED_RCPT(0.00)[linux-doc,ackerleytng.google.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B59EE632190

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>:
> This test uses vmsplice to increment the refcount of a specific page

I recently submitted a patch, which makes vmsplice equivalent to
preadv2/pwritev2, and it was accepted to next.

For now it is just an experiment, it is possible it will be reverted.

https://lore.kernel.org/all/20260601-aufweichen-dissens-ausrechnen-0d9b84728113@brauner/

-- 
Askar Safin

