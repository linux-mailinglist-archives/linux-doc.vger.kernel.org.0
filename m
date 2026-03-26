Return-Path: <linux-doc+bounces-81481-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJduNEu8xWkeBAUAu9opvQ
	(envelope-from <linux-doc+bounces-81481-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 00:07:55 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5EA33CE69
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 00:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 424A43038292
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 23:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F2923C51D;
	Thu, 26 Mar 2026 23:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q8ACBuTX"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D794A313272;
	Thu, 26 Mar 2026 23:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566205; cv=none; b=sArw8U375u/Rau+KfifoeLCRvjXfG/ocTxSTUuRVclvltm8aEVv0EFQpjRceHezI3Uvn2pQan8gx674IbvJmnGOE6PS5SRKm9XF0S6N3iPJAAa+vU7PF6dnxtHp/O+qcpRJ4f5HXLyXanRUFzXvbz945hA4v0jE3giBVV2WzkL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566205; c=relaxed/simple;
	bh=1WrNmgrlJBDLx6OFO3FoeoKK0vtp3k6v7elfaQzOLUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8JnNA3M5oc8cF3iHzNj6BABiH6KkE4QzCFZdLQGpK8rCdlCJWraeso0kD5YlB3h0VOgte8HdMyjnMOnXpIk0kYujMJ/dsSRzIouOK2EXXZcmFc8Kc+rGGE43h31UN8MNRg7tfvxQz0xjNeQ5T4A55OqQdh0zM2l2AP5caFCAeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=q8ACBuTX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=uChA4BslGguDTZ1RtvIK1rwV2EPnidpBOUuJWtA5AT0=; b=q8ACBuTXtlas+orhjJxfPDlHmi
	mi1gJ4fmND5bSIVWNKwZE5dkR/9U7MscA31Jl8PHQ0EbB4L3THNilQZQUcefh571SpnmdHpJkyJY8
	xlzcQzPCwle6WEppWPgGIwrbrCyXSOBtZNJajUvF4aMuVO3lx78TacgIdc/S/A95iFwHl8wl1dlBQ
	gJZljIiwh0OyBpZ39Nkw4EpN0iriEb2J6V+Uwu51eIJ7KPDrJ3DgQ5FAuYHJgWmTMGgJrKLSsPmmA
	EOV6vzcAtagc8wtlKfCc5xR5ip5qOBhjONXRsNgCxbezxlvLUIL+cxYijooi8Y1Js9bojMYJWF1XP
	zf0v245g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tjT-00000006MK9-08ZV;
	Thu, 26 Mar 2026 23:03:19 +0000
Message-ID: <b5e6c518-c7c8-46f7-928c-d4be5a8365dd@infradead.org>
Date: Thu, 26 Mar 2026 16:03:18 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] doc: Add CPU Isolation documentation
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Gabriele Monaco <gmonaco@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Waiman Long <longman@redhat.com>, linux-doc@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Bagas Sanjaya <bagasdotme@gmail.com>
References: <20260326140055.41555-1-frederic@kernel.org>
 <6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>
 <20260326190022.4b249f94@gandalf.local.home>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260326190022.4b249f94@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81481-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linutronix.de,redhat.com,lwn.net,suse.com,infradead.org,suse.cz,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:dkim,infradead.org:email,infradead.org:mid]
X-Rspamd-Queue-Id: EC5EA33CE69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/26 4:00 PM, Steven Rostedt wrote:
> On Thu, 26 Mar 2026 14:42:32 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>>> +Those interferences, commonly pointed out as "noise", can be triggered  
>>
>> nit:                                            "noise,"
> 
> Really?
> 
> Even if it's grammatically correct, it still looks horrible.
> 
>     Those interferences, commonly pointed out as "noise", can be triggered  
> 
> vs
> 
>     Those interferences, commonly pointed out as "noise," can be triggered  
> 
> As the quotes are going around the noun, and placing the comma into the
> quotes makes it look like the ',' is part of that noun and not a
> punctuation of the sentence.
> 
> Being read by C programmers, I would keep he ',' out of the quotes as it

                                            he ?  :)

> looks like a string literal "noun,".

Stephen, all I can do is make recommendations. If it hurts your eyes, tough. ;)

-- 
~Randy


