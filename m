Return-Path: <linux-doc+bounces-91154-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XG+KOIYXI2qjiAEAu9opvQ
	(envelope-from <linux-doc+bounces-91154-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 20:37:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B32A64AA97
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 20:37:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=e9yEA4mQ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91154-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91154-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2BBE6304A3BF
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 18:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6207A3A7F60;
	Fri,  5 Jun 2026 18:28:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E237F399CF5
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 18:27:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780684081; cv=none; b=lm85o3PpAhYdf/LfGgTG+WN/16+fl5umIdau8f7gEY7v7tDeDXJ9f8U1cBfolnYID/B7VS5YZZIoyBY5yC3tKhor+yzOAQR6pxGsRT9XaRZwf0uMY+w2s9v2z4c+EQ/RUBDXddQ9sWWqepPCdhDCzChJc+aTd3MRYHPnysthbI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780684081; c=relaxed/simple;
	bh=5jiFPb4shRixueM3EXqj7rLUUpc6Mvk/umob9LPRscI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EMZaDsFihAL9ZJiyPW8mIjxIk7vP0n9VN4eZYD3a9yqZFWwqV0hPfbOZfp3Iec8gBu4mtrnMzI2/COHkhCAqIXkzKvsBanflAyxptjQjTPkU6YAksAjNNAJjvsvbIwJrtLBjM9buRxwiX7vdkZvZZoPe3aXII2EruIWOdI66+OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e9yEA4mQ; arc=none smtp.client-ip=209.85.216.74
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36d979441eeso2088168a91.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 11:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780684079; x=1781288879; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Al0zDa4bN146O1R+FtGZtDttdy90kv7zGQH5evIcYPw=;
        b=e9yEA4mQM2lut0pEuCRQy3Ps8v9Hyu0Fb1uWNJ62pgvmh5CYZnF9CaZYEwUMxEUlm/
         8Azxab4UduI99UbxJyBd7805CWQsOCFsv4JaKlvMH59Y7Cs+QkZlEjZQII2EuW/mBvl+
         E654i/X+2Q8W3amEZWXtyAubBNvVx1uFvWkQCXYiXnieAzgoTRL/MbVcCjEjU8sqx0P5
         dvgaDa9D8TJAz2YY5WhxLFnWOBWMsxpQKRR5Mfaz95Yk+/6Nl9qtY4/rb4EjxDdkIe8X
         OJUyzKpW/ERHauokVrwmOBbq1m25UU927PjuKGYU2fRqejCMwr3Y+8WzcAOOPP1bdT2x
         5WqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780684079; x=1781288879;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Al0zDa4bN146O1R+FtGZtDttdy90kv7zGQH5evIcYPw=;
        b=Y1+HeDW0TdPAy+SWrhMgaI5tUterlQhXB6OGA73r8jmFl2fhZabCOuC7YkdNw2pad9
         wRKHMohPZqhk5QX0CGan/CC2VtsSsOmHf2t9Cx25KwMizc7YW25L8RsfqSWMTzZMQu0r
         gfMuzLM9VZNqMJJYxuMkqHi99xMM3o6KLUdYARKv7OLZXoLlKeh6xYc0XETAn5Lhz253
         5xpqdlq9gg7DP+/2MyMBWA0FJksjyyK60DNaMMVapdUPY+QpnZZSlR/DaRkDpeKqiCeq
         h8iz/HtnBEoJbkFdJuEzqFMfJl/RIr8kcn/d60sTXZ9fPF1gEE/6jYhIwfMnLE7GISY/
         69SQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KJGdnPs4fwB73V4uIvoezQ+jbPd5p/vyDWC+dh15J81TQIabPF/VWo91Q6UHnpdRLPK+lt20p5Z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlwnwkGc4Yrc52MZW0SseSZkDpCBzNWkvezmneeN/nz1L/Z6lF
	WbiTXwfMigVvSolmtNlOD7ygTnbsGY9zafAYiWQHbxhcrXI4E55b0Q4FF/8FlKP3b8/qLZH0DKt
	xa1PpVA==
X-Received: from pfwp41.prod.google.com ([2002:a05:6a00:26e9:b0:842:5fa6:3103])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5210:b0:36a:1ed8:6fe6
 with SMTP id 98e67ed59e1d1-370f0b58cefmr4684526a91.24.1780684078907; Fri, 05
 Jun 2026 11:27:58 -0700 (PDT)
Date: Fri, 5 Jun 2026 11:27:58 -0700
In-Reply-To: <CAEvNRgHz5GDjq0GqRmpQdHc-X45gCNr39VYWZH-T7XhPEtN5CQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <CAEvNRgGpaggjd3=ooyzv7iEbmA-x1mWJHgjLSjPi8=5CPrk-yQ@mail.gmail.com>
 <aiHeDZEPkAcWcSkn@google.com> <CAEvNRgHz5GDjq0GqRmpQdHc-X45gCNr39VYWZH-T7XhPEtN5CQ@mail.gmail.com>
Message-ID: <aiMVLtblIKu1DQWJ@google.com>
Subject: Re: [PATCH v7 00/42] guest_memfd: In-place conversion support
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91154-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,linux.dev,linux.intel.com,intel.com,google.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:devnull+ackerleytng.google.com@kernel.org,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:ira.weiny@intel.com,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foun
 dation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,m:devnull@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,ackerleytng.google.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B32A64AA97

On Thu, Jun 04, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> >> + KVM: selftests: Test conversion with elevated page refcount
> >>     + Askar pointed out that soon vmsplice may not pin pages. Should I
> >>       pin pages through CONFIG_GUP_TEST like in [2]? I prefer not to
> >>       take a dependency on CONFIG_GUP_TEST.
> >
> > I'm not exactly excited about taking a dependency on CONFIG_GUP_TEST either, but
> > it probably is the least awful choice.  E.g. KVM also pins pages is certain flows,
> > but we're _also_ actively working to remove the need to pin.
> >
> > Hmm, maybe IORING_REGISTER_PBUF_RING?  AFAICT, it's almost literally a "pin user
> > memory" syscall.
> >
> 
> Hmm that takes a dependency on io_uring, which isn't always compiled
> in. Between CONFIG_IO_URING and CONFIG_GUP_TEST, I'd rather
> CONFIG_GUP_TEST.

Or try both?  If it's not a ridiculous amount of work.

