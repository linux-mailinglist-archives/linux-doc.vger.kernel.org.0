Return-Path: <linux-doc+bounces-94114-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GJq9KHIZQ2o5QQoAu9opvQ
	(envelope-from <linux-doc+bounces-94114-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 03:18:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F87D6DF8F9
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 03:18:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EmvraI1J;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94114-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94114-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E56D9301875C
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 01:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34E233D6E1;
	Tue, 30 Jun 2026 01:18:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D354B366061
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 01:18:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782782316; cv=none; b=GyrhHvyD+hJLc6Gmv52n+DQyBoR7s+Cs7PcQeYVVKnUd09v4pUwnfjSMEQQiOWSes08P5U+sAUs5xuvOVYc66jp3ro1ZlXHx6TqNHIh+B05JUZGF4kEFG2f4X3VhUvcwyokREHmfVxUwen06jyupUuGOJQgb6MA4vOJpQKuQskc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782782316; c=relaxed/simple;
	bh=IEVztoCaExyvaynAAU/FakjpC5YBFcEfkVZ3+mImL9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKiLM607V6hVXn68XnA72flxuwVnOp/3L5xmflYAPt8h79DeMrBAKkAGwg0PHtvwwkmo2gI56gNH53Xo0fUKOWr82jmtbdxDq1M6QojOQApK05NYcJhI2U8RSot7ZmMCDxev2EQltz7WjrfZgyi2AS0BGex6lXG2atEGIrO8wK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmvraI1J; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37d46e0d246so1776972a91.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 18:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782782306; x=1783387106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjccltFszzoLCJ/RxIOjcBIRQ6g0sQYI1eSvIvcwjP8=;
        b=EmvraI1J8WGHUMPoippzTDCsBlOoucYqlqc8lP6/Y1bF5bp+e8ppLjuMN8oNiCC3aI
         H0a0fAu5yZh67q2qMiYRNeJr0GZy4aqu4PEUIA9eNlKDaeVGhtHUlRSqxYEPymhdEueI
         J4WJ7AqgC5aI8waicuCFcb10YbLq+lOw/zYxKtCJNZG9UBajzOsxKNPcFYGw17uNDsIh
         7PXKtv9LBVhfMpXZVd90KTp0wdvT8NWOL24uLrDsuOeXCTcXNZncwCKIdJws1Elm6XHQ
         j6v2dVpl2Gf2zepQOabo6zIafPR7x4k0g9Hla7xGs68dqI6uP+3cjYyBOcipWhHPnATw
         65ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782782306; x=1783387106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VjccltFszzoLCJ/RxIOjcBIRQ6g0sQYI1eSvIvcwjP8=;
        b=dEqu/aEVVXU+EDlzXVK7byYtPZXi8vaKo0MutyLzu3lcuDfo7AAMYhs3TFSwi+BLzF
         aiz5G8ydZ6NNN4eKejjiIZh+mF/o0vkAp+Yv/SAnWJSshIvAIFglszNCcLj49IZsooQr
         8kuHcrWtVt7lHIqlhViWNYjsJjkJsRhFNs5ExF33jFdfGlokL+RkETu1fx0il2dt52Lc
         5ycs5GwMyLk5A2f3csBANQDGIf4rd45jHO9MxvSZi9E8yQ6SAvVtBzru/EwQTSvJwdfd
         sIL43ijYIwIITqXMSPfJHe3aUiHi2oDsVmMowKBiDSeLzY6rLE2edGJgiUF+c9G/vUdB
         MM6A==
X-Forwarded-Encrypted: i=1; AHgh+RrcFB+g3rr+t3OJGN1aWqEdpZ1j0j6VLbKJNQhCGjfI2BlCbf+HMQMQyZz9Nu3U5mdIZFCoPKRJO20=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX979A6pN87XBkRxvGCWEdTsye+UvJkOmQvSihWs5L4i10o6w6
	s5T+vzlqqeU8+wwDL6yYcDxY1+sMnQw30O+iQGYzG8foEpfA6OdzBa6v
X-Gm-Gg: AfdE7cnpE0E6eTDsOsYGKXJeSZXdtHxdMvthJWFnlYb3v3L2ucMQTaYpVWROrViYTWv
	lpibfz2tmdygBmMtCf/NDMpJzdsfTgQw56C215dDBf0Jt/OAk6LJEQHnyYv6CYoIRLEm859g/65
	6GOdgqNfZR2nZQMKvlmnwiksalChctba4Ap0CLC63giMtxkWdk0jdzyDUOyX4Gjbe2yX140v2BL
	4iRiK+//fIMuH5AmN8CNxJzEwryraw05wWjYMPdax9f1bWBvR+SmzdBA2ztHrHKPa2HzLkVm0f7
	XL7CjeC0SzWVhu1lOE+U9cnVXcncI2UlkBNCsfDkfErNAX39GkM6djOmthSnXsbIOjFZWVs6qPJ
	Tv1r5Yk4h0AQAyDHx57nUJTctkUtkrfifTCgh36zbP09HOrszoeMG+l7iyEz6+PZ+YHNqEF0+71
	OskBF/Kxkhd3zJ4fU6zL7njEpAkpCpiDc0tzMeKFXCmEY=
X-Received: by 2002:a17:90b:2cce:b0:37f:9ce1:7367 with SMTP id 98e67ed59e1d1-3805277ed34mr1245013a91.29.1782782305643;
        Mon, 29 Jun 2026 18:18:25 -0700 (PDT)
Received: from [10.125.192.77] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380529ab9f4sm603942a91.7.2026.06.29.18.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 18:18:25 -0700 (PDT)
Message-ID: <a152be7a-b36b-3b54-0cf8-20f453905bef@gmail.com>
Date: Tue, 30 Jun 2026 09:18:06 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v5 2/6] mm/zswap: Support batch writeback in
 shrink_memcg()
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-3-jiahao.kernel@gmail.com>
 <akMK9z_GOarOZWHz@google.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <akMK9z_GOarOZWHz@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94114-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jiahaokernel@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:yosry@kernel.org,m:akpm@linux-foundation.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:shakeel.butt@linux.dev,m:mhocko@kernel.org,m:mkoutny@suse.com,m:nphamcs@gmail.com,m:chengming.zhou@linux.dev,m:muchun.song@linux.dev,m:roman.gushchin@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jiahao1@lixiang.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,cmpxchg.org,linux.dev,suse.com,gmail.com,kvack.org,vger.kernel.org,lixiang.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiahaokernel@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F87D6DF8F9



On 2026/6/30 08:21, Yosry Ahmed wrote:
> On Mon, Jun 29, 2026 at 07:20:28PM +0800, Hao Jia wrote:

>>   
>>   static void shrink_worker(struct work_struct *w)
>>   {
>>   	struct mem_cgroup *memcg;
>> -	int ret, failures = 0, attempts = 0;
>> +	int failures = 0, attempts = 0;
>>   	unsigned long thr;
>> +	long ret;
>>   
>>   	/* Reclaim down to the accept threshold */
>>   	thr = zswap_accept_thr_pages();
>> @@ -1373,7 +1422,7 @@ static void shrink_worker(struct work_struct *w)
>>   			goto resched;
>>   		}
>>   
>> -		ret = shrink_memcg(memcg);
>> +		ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
>>   		/* drop the extra reference */
>>   		mem_cgroup_put(memcg);
>>   
>> @@ -1394,7 +1443,7 @@ static void shrink_worker(struct work_struct *w)
>>   		}
>>   		++attempts;
>>   
>> -		if (ret && ++failures == MAX_RECLAIM_RETRIES)
>> +		if (ret <= 0 && ++failures == MAX_RECLAIM_RETRIES)
>>   			break;
>>   resched:
>>   		cond_resched();
>> @@ -1504,7 +1553,7 @@ bool zswap_store(struct folio *folio)
>>   	objcg = get_obj_cgroup_from_folio(folio);
>>   	if (objcg && !obj_cgroup_may_zswap(objcg)) {
>>   		memcg = get_mem_cgroup_from_objcg(objcg);
>> -		if (shrink_memcg(memcg)) {
>> +		if (shrink_memcg(memcg, num_node_state(N_NORMAL_MEMORY)) <= 0) {
> 
> Why not just 1?
> 
> I guess the current behavior will try each node. But this doesn't really
> match it, as we may reclaim everything from the first node. Right?
> 

Yes, it just keeps the number the same as before, but the behavior is 
not exactly the same.

> I think it's probably fine to just do 1 here, fairness is not the main
> concern in this code path, we're really just trying to free up some
> space to free up some space for the incoming page. I doubt these limits
> are actually being used extensively anyway, so we can revisit this later
> if needed.

Okay, I'll do this in the next version.

Thanks,
Hao
> 
>>   			mem_cgroup_put(memcg);
>>   			goto put_objcg;
>>   		}
>> -- 
>> 2.34.1
>>

