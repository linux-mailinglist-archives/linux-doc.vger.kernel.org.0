Return-Path: <linux-doc+bounces-89942-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI2NFAEaGWoMqQgAu9opvQ
	(envelope-from <linux-doc+bounces-89942-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 06:45:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA25FD20C
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 06:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9529630CC9D8
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 04:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3BF3750D7;
	Fri, 29 May 2026 04:44:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641D4372EFF;
	Fri, 29 May 2026 04:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780029860; cv=none; b=J0NVJ4icSG5XonnyZBqFCcwx3TUYCx9y8Q7SWBXkwKFXnYzej5MAhKcjZ9UpyI0x2S+5N8K+he7wIkxwcY4mej1MClRJjq4SkyOv417+apVNTWzeyXxkaW1GGQUmkKxyrdwTbUbWGMLhXF7bGGJhMurpzrLQY0MjMLaOzdg4WKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780029860; c=relaxed/simple;
	bh=QEs5qkJs1cWjEQRAjOwrvbWZvryUHAaTTH/XHRjPG6g=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=CDWC/SIHiHr7n9+IFn44d5mfO2YiJZR6WHg+guhCIP1GMzPER/Kh5+6powz9pCdRE4ag/F+rzg0M6Am7qUGgIu3HwhAyPY3wRnJ7twouR+pujqib0M7Gypw90pPxQStgbBxLu5RhjKch/rvJYZhn0KWqfkNeiOjnZ2dPrvczVzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gRW3K4Fg7z58fdH;
	Fri, 29 May 2026 12:44:13 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 64T4iANX060281;
	Fri, 29 May 2026 12:44:10 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 29 May 2026 12:44:10 +0800 (CST)
X-Zmail-TransId: 2af96a19199ae05-43be2
X-Mailer: Zmail v1.0
Message-ID: <20260529124410822pexFmlFsVNGRXq_DUHUmg@zte.com.cn>
In-Reply-To: <20260527125034.ba695164344d2645dd055af0@linux-foundation.org>
References: 20260527213558929EhiHHy9EDTMjmg3uuDOMi@zte.com.cn,20260527125034.ba695164344d2645dd055af0@linux-foundation.org
Date: Fri, 29 May 2026 12:44:10 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <akpm@linux-foundation.org>, <linux@weissschuh.net>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <xu.xin16@zte.com.cn>, <linux@weissschuh.net>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBsaW51eCBuZXh0XSB0b29scyBoZWFkZXJzIFVBUEk6IHN5bmMgbGludXgvdGFza3N0YXRzLmggZm9yIHByb2NhY2N0LmM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 64T4iANX060281
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Fri, 29 May 2026 12:44:13 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A19199D.001/4gRW3K4Fg7z58fdH
X-Spamd-Result: default: False [1.69 / 15.00];
	SUBJ_EXCESS_BASE64(1.50)[];
	R_BAD_CTE_7BIT(1.05)[unknown,utf8];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[zte.com.cn : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89942-lists,linux-doc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[wang.yaxin@zte.com.cn,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,zte.com.cn:mid,zte.com.cn:email]
X-Rspamd-Queue-Id: A6AA25FD20C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>> From: Wang Yaxin <wang.yaxin@zte.com.cn>
>> 
>> Background
>> ==========
>> After commit 9b93f7e32774 ("tools/getdelays: use the static UAPI
>> headers from tools/include/uapi"), the Makefile was changed to use
>> -I../include/uapi/ instead of -I../../usr/include to ensure tools
>> always use the up-to-date UAPI headers.
>> 
>> However, only linux/taskstats.h was added to tools/include/uapi/ in
>> commit e5bbb35a07b3 ("tools headers UAPI: sync linux/taskstats.h"),
>> but linux/acct.h was missing.
>
>Please let's Cc the author of both of these commits!

Ok

>> Problem
>> =======
>> This causes procacct.c to fail to compile with:
>>
>> procacct.c:234:37: error: 'AGROUP' undeclared (first use in this function)
>>
>> gcc -I../include/uapi/    getdelays.c   -o getdelays
>> gcc -I../include/uapi/    procacct.c   -o procacct
>> procacct.c: In function ‘print_procacct’:
>> procacct.c:234:37: error: ‘AGROUP’ undeclared (first use in this function)
>> did you mean ‘NOGROUP’?
>>   234 |  , t->version >= 12 ? (t->ac_flag & AGROUP ? 'P' : 'T') : '?'
>>       |                                     ^~~~~~
>>       |                                     NOGROUP
>> procacct.c:234:37: note: each undeclared ident
>>
>> because procacct.c uses the AGROUP macro defined in linux/acct.h.
>>
>> Solution
>> ========
>> Add the missing linux/acct.h to complete the static UAPI header set.
>
>It has always annoyed me that we do this by copying the file.  I'm
>surprised that there isn't a way of using the original file directly.

Using -I../../usr/include avoids duplicate headers and relies on a
single original copy, but requires make headers_install. This aligns
with commit 9b93f7e32774 ("tools/getdelays: use the static UAPI headers
from tools/include/uapi").

Using -I../include/uapi/ keeps two separate header copies, which may
cause inconsistencies when one copy is updated. Can we optimize it
with symbolic links, or revert to the first solution?

Thanks
Yaxin

