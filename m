Return-Path: <linux-doc+bounces-81238-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE2nMU06xGnkxQQAu9opvQ
	(envelope-from <linux-doc+bounces-81238-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:41:01 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D746B32B5CD
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7221C300BCA5
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 19:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A4334D385;
	Wed, 25 Mar 2026 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Q4BPq+/R"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2298E34C9A6;
	Wed, 25 Mar 2026 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774467621; cv=none; b=TX4Uy4HgFvOy71vKhSdF72L3qny9Cktbbu4kzMYePf8Z9L04tZQWWNgZ8xHNTe9DEXUVyJ5vBAjcDW7F4wNy+qg9NdxsyPtm4o6YOmUQLCXA1eu5/hKWg4pbztAO7czJe5vq/+Z8TbPzXoI2vvkAMB166VZ6UPP/3hAbDUyURjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774467621; c=relaxed/simple;
	bh=9zX7UtGytQM7vMV1uL87V8xV2ol0NYGkhlfUJHvglKU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=laqMSwsDMxZK6Qh1WTISUGtAdChVPIwaVxuyGAf89XLahZq2bGsMl8qPwj23M+fJzmicKrnt/sLjk1kHhVYxP/t7qcRaXGaAIGBYgWdqXBW9U203KQQ/8g2YsHfHxWAyirZdJK5fd/UUtfqT5bFvAmCKqpF++HEP9lb1VJ+7wQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Q4BPq+/R; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5CA4240C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774467619; bh=l3ZvicdM3Z/ujrHLRbQeTksh7B+HcLZrfxR2WZIahyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Q4BPq+/RbCABlzx0Otv+ob9R63AyZ9CKp9MzvkkSj2UpaAK3xgqpCugDeyvCGoBPW
	 cSRcQIjCz1Zj6qx+OJSRrThUEunkoHEq9ozi7O7fTxDHcP+obQMOQFxnUsnEYhp/ML
	 agZ6JLwaVTkkIeX2cuBsIjxzkHssZHfQPcW2c2kKli37rUsRqgWs6mWCIkfcwk7RNp
	 KsbFeNH3PucePTLFBeulFFO50mP1p8OWzGdWJjKARXBJmxbxHbkiETSVSQNv8iNZD3
	 oA23VVCoh/Bpy0ANXQfAH6Yon6ed/SrDALt74iMspXEkJBuOr0fNkOyShoDfHUDKYZ
	 cO4UEsS0JDGTA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5CA4240C6F;
	Wed, 25 Mar 2026 19:40:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksandr
 Loktionov <aleksandr.loktionov@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 0/7] More kernel-doc unit tests
In-Reply-To: <874im3g0w6.fsf@trenco.lwn.net>
References: <cover.1773841456.git.mchehab+huawei@kernel.org>
 <874im3g0w6.fsf@trenco.lwn.net>
Date: Wed, 25 Mar 2026 13:40:18 -0600
Message-ID: <871ph7g0kd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81238-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lwn.net:dkim,lwn.net:email]
X-Rspamd-Queue-Id: D746B32B5CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Jonathan Corbet <corbet@lwn.net> writes:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>
>> Hi Jon,
>>
>> This series comes after
>>         https://lore.kernel.org/linux-doc/20260318104321.53065c27@foz.lan/T/#t
>>
>> and contains the remaining patches I have ready to be merged.
>>
>> Its focus is primarly on adding unit tests for some corner
>> cases. Several of such tests came from Randy, and were already
>> previously submitted on some old series.
>>
>> I added a couple of extra tests there to check if tables and code
>> blocks will be properly producing rst and man content.
>>
>> Due to such test, I ended discovering one bug, fixed on the last
>> patch on this series.
>>
>> On this series, the actual tests are not part of the unit test
>> source code. Instead, they're loaded from an yaml file that
>> uses a properly defined schema. One of the tests check if the
>> file follows such schema.
>
> I've applied these, thanks.

Actually nevermind...it appears that this series was superseded by the
set sent on Monday?  I've applied the newer set instead.

Thanks,

jon

