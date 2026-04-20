Return-Path: <linux-doc+bounces-83844-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDK3LnC55WmwnQEAu9opvQ
	(envelope-from <linux-doc+bounces-83844-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 07:28:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 64740426DA1
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 07:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC98A30054DF
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 05:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0037837FF61;
	Mon, 20 Apr 2026 05:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b="O/7mWMQ/"
X-Original-To: linux-doc@vger.kernel.org
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0292C326C;
	Mon, 20 Apr 2026 05:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.212.243.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776662893; cv=none; b=cD9tArk5u5LnyWl7VDc0Gn144NzH5uPUAq69IYhveJRNBjPqPaLUk9DCGeOY931yQR6gz39nivNJpBrpYdzafbW51fWoGVYeB1ZRUyq5Y2l144FBpSvTA8IJLL/tQl0gzjFRdjYNbCstOMT4KJA5i8c45iHz//K5Yfvtz7VLLtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776662893; c=relaxed/simple;
	bh=5pFfAh0w8FoorL1tj4Eo6xVJ2XthVkrf9fRKjTtD1aA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIT//eEl9ptX/XBkKcHxVGWKmSMDMBTVtbDcSKl8tSPBBKwh9ATkQQc6R3xLsG6uuKCU4XYwYCq38ZSr4OzfLQcGUc0wfaxXH0vjWM57vjNmkTCu3JYqI+vFm+t+SiuQVJy2A/Hi5g8Xqvi/q3nAFSAiKxlNdj+UUfSpYkBAmG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp; dkim=fail (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=O/7mWMQ/ reason="key not found in DNS"; arc=none smtp.client-ip=49.212.243.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 63K5R9l2040505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 20 Apr 2026 14:27:09 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=zYqBi5Y7SR8juLwBRICUsdi/c0VzNDgvxNB9NS9Ihhs=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1776662829; v=1;
        b=O/7mWMQ/1Txgcq83Zz62yWSSux2cnql95+dF4NKmTQQ36GGq2zOlxgygimjHS7rK
         QO7SJEiAYsGCw2hyAEfp2dxSbmYksGEpyKjIkX9sAqfsqFOR20VCHYv4OF8mYYJk
         dn/kGNqtvWlBLp9fo2rwzsgifb1A3Xkmk9OnmIUicx1UuVhgl24WCAT0FuTdxnfw
         n9R/xRc2LawyKhC0rslMiN+blLIKkm8vjADTYVdqIy74ZkN1uG6yMkBuiaAVDd2u
         YorDbuNva9Uk1LlmuoiGaPVrt3yrY3OSUzujy4uXsa5F+tVVTRy9a6MYN/c7xjNQ
         5cBa22eQ/DJCl3bNh4hiTw==
Message-ID: <73cc9b30-091d-44d6-8a57-d4aa97ad678c@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 20 Apr 2026 14:27:08 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] KVM: arm64: PMU: Add
 kvm_pmu_enabled_counter_mask()
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devel@daynix.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260418-hybrid-v7-0-2bf39ad009bf@rsg.ci.i.u-tokyo.ac.jp>
 <20260418-hybrid-v7-1-2bf39ad009bf@rsg.ci.i.u-tokyo.ac.jp>
 <87o6jfavhx.wl-maz@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <87o6jfavhx.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[u-tokyo.ac.jp : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83844-lists,linux-doc=lfdr.de];
	R_DKIM_PERMFAIL(0.00)[rsg.ci.i.u-tokyo.ac.jp:s=rs20250326];
	DKIM_TRACE(0.00)[rsg.ci.i.u-tokyo.ac.jp:~];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.688];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 64740426DA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/04/19 23:13, Marc Zyngier wrote:
> On Sat, 18 Apr 2026 09:14:23 +0100,
> Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>>
>> This function will be useful to enumerate enabled counters.
> 
> Consider expanding this commit message a bit. Something along the
> lines of:
> 
> "Add kvm_pmu_enabled_counter_mask() as an accessor returning a 64bit
>   mask of the counters enabled on a given vcpu.
> 
>   This will eventually be useful to iterate over the counters."

That looks better. I think I'll use that message for the next version.

Regards,
Akihiko Odaki

