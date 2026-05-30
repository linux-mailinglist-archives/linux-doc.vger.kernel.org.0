Return-Path: <linux-doc+bounces-90115-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DO+EpVaGmqa3wgAu9opvQ
	(envelope-from <linux-doc+bounces-90115-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 30 May 2026 05:33:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8BC60B2E0
	for <lists+linux-doc@lfdr.de>; Sat, 30 May 2026 05:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85A14301D128
	for <lists+linux-doc@lfdr.de>; Sat, 30 May 2026 03:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B7B175A6B;
	Sat, 30 May 2026 03:33:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D9730E85C;
	Sat, 30 May 2026 03:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780112012; cv=none; b=WPpT+umLitsJ/8ra6KxgYnsBpZrT+FsvVg1uGejf4FQR5p9WePl5kgxf8N87Antk75r4Qh7rdEVlbWezGV9pbi3zgmqxHrAmDGOl0aVTjzV+hov9bxNjTZqJYf7O4ExKKh7lQQVzTzhs7lhvQCznIwZ+TOO4tTc88eVzNvufOmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780112012; c=relaxed/simple;
	bh=1GnpDdLTmgf9pTmI765HnGs56jzxJO9vzHe9z9NDWv4=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=c8QK7NfgPBJpPAKWVzUeNpZoCKn0bMcPVg3AYL3DlfyoY9Gqp1a8ArhgRweq40Bb3uYQ3vqwavuuXAGAe0MjKlNCRXdH4ComF8OhJclOAGC8rwMcFLqqidsHrzPo/COFTv0RPtOSm+LbsezBzntEkrhUgyC8TKhTSP5a0KXkJg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gS5RB36Zhz51Srn;
	Sat, 30 May 2026 11:33:26 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 64U3XKo0030401;
	Sat, 30 May 2026 11:33:20 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 30 May 2026 11:33:21 +0800 (CST)
X-Zmail-TransId: 2afc6a1a5a81a7d-d02d2
X-Mailer: Zmail v1.0
Message-ID: <20260530113321615TRlbmM7bJFBTApGF05oYW@zte.com.cn>
In-Reply-To: <6263830a-1559-440d-b914-8e3aff08fdaf@t-8ch.de>
References: 20260527125034.ba695164344d2645dd055af0@linux-foundation.org,20260529124410822pexFmlFsVNGRXq_DUHUmg@zte.com.cn,6263830a-1559-440d-b914-8e3aff08fdaf@t-8ch.de
Date: Sat, 30 May 2026 11:33:21 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <linux@weissschuh.net>
Cc: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBsaW51eCBuZXh0XSB0b29scyBoZWFkZXJzIFVBUEk6IHN5bmMgbGludXgvdGFza3N0YXRzLmggZm9yIHByb2NhY2N0LmM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 64U3XKo0030401
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 30 May 2026 11:33:26 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A1A5A86.001/4gS5RB36Zhz51Srn
X-Spamd-Result: default: False [0.64 / 15.00];
	SUBJ_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[zte.com.cn : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90115-lists,linux-doc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[wang.yaxin@zte.com.cn,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zte.com.cn:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3D8BC60B2E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Thomas

>> >It has always annoyed me that we do this by copying the file.  I'm
>> >surprised that there isn't a way of using the original file directly.
>> 
>> Using -I../../usr/include avoids duplicate headers and relies on a
>> single original copy, but requires make headers_install. This aligns
>> with commit 9b93f7e32774 ("tools/getdelays: use the static UAPI headers
>> from tools/include/uapi").
>
>This requires the presence of a kernel build. Which is not guaranteed
>for tools/. You could put it in samples/ which is part of the regular
>kernel build and can depend on up-to-date UAPI headers.
>
>> Using -I../include/uapi/ keeps two separate header copies, which may
>> cause inconsistencies when one copy is updated. Can we optimize it
>> with symbolic links, or revert to the first solution?
>
>See tools/include/uapi/README for the background of the current
>solution. I would stick with it.

Thanks for your reply. After reading tools/include/uapi/README, I now
understand the background of this solution. It seems the second approach
is indeed the recommended one for now.

Thanks
Yaxin

