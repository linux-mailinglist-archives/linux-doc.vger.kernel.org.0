Return-Path: <linux-doc+bounces-82892-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KBnGhqv12kORggAu9opvQ
	(envelope-from <linux-doc+bounces-82892-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 15:52:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 073553CB965
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 15:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FD0930058D8
	for <lists+linux-doc@lfdr.de>; Thu,  9 Apr 2026 13:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B6B37BE7D;
	Thu,  9 Apr 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYoezael"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0120B3CCFD3
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 13:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742698; cv=none; b=OM6zbLNoCkByONEAIIfeV9gnp9iPdYyI/6g9OpbFKvSkLSfNfSJ2gBRpgqAAHh2H69NpIuKSLEsQKfaRsWf8yt7nHwA2XqZRW+P89cUCb7H4Igvro2uvYuiowtwC2GO+2OIUCpl8BIhm/T5NRAWt/l50yZzj3eZxUyJh9fZGxvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742698; c=relaxed/simple;
	bh=mXswLbpZ9JdNrB/0wHEoAET14UB/DAIGJpdHVt4myYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0flg5AmbF9o9KiAT2xPbbTXQZhNoNuI+vrvy4bOt4e2OTnUrB3usixdaKiZ7CTL3Qs+2/teirbF8bVxctM1J/f8oKuTNptY6xRIAfI7EUvRmI21Tn6JHs3+fDeOzwfh/abGFCUhKo39TEpRw8DZVzO7iYFBp3OWTapnHfoxCsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYoezael; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b23f90f53aso9484655ad.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 06:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775742696; x=1776347496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tue4I7fN80NEM0l+iK4jKzlt1Vf/f8zpQJWvkc7j1KM=;
        b=nYoezaelYRw0OC+aeN0NsrnWWatRj24pffSMA5C4eziEmJTj8su1NGRhYrJ+9XCPJ4
         0fp0ENT2RdhjU6QGeWvPt4Lr9GkLEH7QGoKVyk+htwQD46w+jwH5kD/i/ki2DocgNxo4
         5ia1Ko56Y/XZ1Pw3pAmU35Uv6hu2wg3vusShhQEntBlE9spCHaQuaffZ2R3riSc+01ot
         fIxE6TSneYb3PkciuCJfIUKdbZuMqPvCw7mw6Fx5c4B0Ys5VHlXLZ9lv+dRVYMmvQLZc
         aIcWtm2alh8OVQPJYIBTmlJSTOcWu9d6CICJFa/dQk+EAF98GUXswIAGzWZdXN5s4FbR
         GUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742696; x=1776347496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tue4I7fN80NEM0l+iK4jKzlt1Vf/f8zpQJWvkc7j1KM=;
        b=c0m8L1csWjxhw8TQnMu054hsyEcKBfMzWTUVXRtAhVmvNd0FLZ4GF3CL1/RqBP6yW1
         ZspMjP/FgjXqmyrJyJkqzgxH+bMF5H+L6J2pGVQKYfpyR0DTZ6fLLvAZA0LFcu1owRCO
         N9qnhq/vr/AjKkzne+L2Eam4ymBU4XzMG9eYthZThu6MYXBToxc/rVoBfIUJH0YWUhur
         c2lsXJLcHYc8kmo/g/zV7ixkmLWHJLPbQdbkBp8E3QHWIAXArxXcnI1cRDVl5D5zK6Op
         BdTp0jfY5uo2kiRSBq6lU50B7sA7ORd4Qq9owTacYGdszCfTHaBoHd68edlP30cX+h7N
         vXMg==
X-Gm-Message-State: AOJu0Ywqegl91YB5+l4imthxll8yGr1OcuI1civjf6XXhgzIO/QUpSbz
	V9RFMlF/YYAdmarf3XU0nd99xjps3lc2/NvQZQ3/00yP4/bTLFy3xx2x
X-Gm-Gg: AeBDiesQFFzWFBOWq7E2UIddfIkU+h+09EmduM9WTRxmewuodjQt7O2n0/yE4kpMjj7
	20OKSzcWxR4l9B6Ne6Oy6m7tQeYsgRqH6mTK1MVyhh01OVnCl9ML4N2ZiiGaWj/GKgjDCt+n7Zy
	7J2ZGST2QPS3Q/Ykm/qhWTd6CSP3dBH4/DFqVErD1sQp0m7kYFVJmq3ldZ34ZCtXRpLRHfJlXiK
	grzuXUSegwr7IMkDcj329QvSmP8uaDCDdQDpzEBqkdES3gqD+DXOdg++VN9ReMkl323Mf71tVpA
	KhUosTMiPfepIvZtFmmqqcN5tHRCgyTcqenh5sFO3TgSh/s8hMTtygdkp6fOv8PBy9Qeyk5yyJt
	8q5J5ZuWnIBKyBbHwpIgXf6UgOz1lAsreXeKN2+TOQ9O5rsPCmTL8xBADg5cBJ6RyC++bqaq9L7
	7wVWZq0SwODpTKA6wXLqTlgRxoihYuGWhA8B61o9a+2O8paAE0TQL52lYVQNN287pk
X-Received: by 2002:a17:903:a86:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b2817995b8mr254896395ad.23.1775742696279;
        Thu, 09 Apr 2026 06:51:36 -0700 (PDT)
Received: from ?IPV6:240e:38b:d99:bc00:6f49:80a8:c181:297d? ([240e:38b:d99:bc00:6f49:80a8:c181:297d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27475ff56sm236508365ad.22.2026.04.09.06.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 06:51:35 -0700 (PDT)
Message-ID: <909032ed-a67e-42e2-8f34-b5bc5472b1a4@gmail.com>
Date: Thu, 9 Apr 2026 21:51:27 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] docs/zh_CN: update rust/quick-start.rst translation
To: Gary Guo <gary@garyguo.net>, Dongliang Mu <dzm91@hust.edu.cn>,
 Ben Guo <ben.guo@openatom.club>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <cover.1775619061.git.ben.guo@openatom.club>
 <b5e1246269848fc95d118a722fb11eee88961053.1775619061.git.ben.guo@openatom.club>
 <DHNQOSMQJV1A.18UJB6VG0QK70@garyguo.net>
 <46eb585f-4983-4821-9be8-ef57571c3516@openatom.club>
 <DHNYKCR34P1F.1EZ3D0A8UB8S5@garyguo.net>
 <d7e81015-f17e-4ab9-a9e5-d2ac6dd82e7b@hust.edu.cn>
 <DHOJEMI0WBYX.2Y6HFZ2PYD7HS@garyguo.net>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <DHOJEMI0WBYX.2Y6HFZ2PYD7HS@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-82892-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seakeel@gmail.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 073553CB965
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/4/9 18:03, Gary Guo wrote:
>> Hi Gary,
>>
>> Let’s wait for the rust-next changes to land upstream first, then I’ll
>> ask Ben Guo to sync that commit. Otherwise, the Chinese translation
>> would do not match the original English doc, which will confuse readers.
>>
>> We have checktransupdate.py in place for monitoring the updates in
>> English documents.
>>
>> Dongliang Mu
> Given that you have tools to catch this, I'm also okay with this patch landing
> as is, with a follow up translation when the new quick-start.rst lands upstream.
> 
It's better to have the full translation after the formal English 
documents merging into upstream instead of several parts to combine for 
a whole document.

Thanks
Alex

