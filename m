Return-Path: <linux-doc+bounces-92614-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v/mmM6h3Mmqy0QUAu9opvQ
	(envelope-from <linux-doc+bounces-92614-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 12:32:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CDA698846
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 12:32:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b="ampRK/xP";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92614-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92614-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD355301E951
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 10:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422573A6B9D;
	Wed, 17 Jun 2026 10:27:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C2F391825;
	Wed, 17 Jun 2026 10:27:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692029; cv=pass; b=oGAxtTkszU+oNRfrvn5BK8te33pY+oAsfkoI1SjV7Vsi3tADfZdVW7nEkEB5IPJhuP+OQ+gCX/iLVCFHjtiPzV2nBRVC0BSGoJjN9r7PImFnN6IwkP/PZ6ckJDvfY55ALUGNiUA1l1VnEajRxgVmZnc/wH1USWm3NZzg+tZwb6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692029; c=relaxed/simple;
	bh=gBvRjungQc+SjWsZcX2jvk4sfIR/H5rHSoI1Oj8gTEo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Qf1xhiROkOzgDtghfT4TlkmLj34VL9j3rUkLWGqz/HqzLlYvSqeAiwSZsI6Xe3EnLRUCRB9rPyhJzSRejRl4yTuoZviykxZ2YTtMZP4pk7u/ANhDRdbZvJMMEVDrB7tpFRmiyKTHH7/yl56SGDaxMNGG3kVYY6n4Z+VBOgB4M2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b=ampRK/xP; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal: i=1; a=rsa-sha256; t=1781692011; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ue5oXAl9F7ELi+KTPstMmz2A+U3SMZPiGObgDbVkPUxcg3XZAqMS/3YlGNXbxObXG4JuiqHXLYi1gqtY+P+7wCbv5hFHcoSAMLF7Gz6gDjs6PGUfulUxe+l9i6jkJ7Hq+V9pFeP5aMgLvbLOTY6GO2d2ksQ9QQJl1YrMEOSAVtw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781692011; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=1emWFubp8fhk0p8wRgcHjKQfLWOipWqTOmpA1GxvLXI=; 
	b=lDIdzrikJzw019VkNxQoCtVB4Axfdf8zUIyIAf9zUTgtsUoxdq+IMe/oPwiOv98aGgv209fCqbrEWhPKpZHrWAQqLxhLJkiH4dcT+F4hTahCA9teycebqpfsO3S5u5ypKTTFFPj8BBa0ZtKn3aOaLe6LXHf1i9ymT7EinVDrKaE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
	dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781692011;
	s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=1emWFubp8fhk0p8wRgcHjKQfLWOipWqTOmpA1GxvLXI=;
	b=ampRK/xP6cYVELmzPQ9ehi8thlId81Ohq1CmlAdFqHPl7vMwivuEe9MZsIPapF3Z
	AEJzRQXww9cDgkiPZEcsIwUVLIIdatzTbcpmsbIYgp0udfQ/KmvywVJLv09VW4wQa68
	KncITCltrnxisw1TwNxmRBA7yCrWQ4Zhz0//PCnY=
Received: by mx.zohomail.com with SMTPS id 1781692010159756.5896442687364;
	Wed, 17 Jun 2026 03:26:50 -0700 (PDT)
Message-ID: <d8d515e4-1184-4898-b459-c1485f82ce8a@collabora.com>
Date: Wed, 17 Jun 2026 15:56:44 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/doc: recommend forking drm/kernel rather than
 uploading a distinct copy
From: Vignesh Raman <vignesh.raman@collabora.com>
To: Eric Engestrom <eric@engestrom.ch>,
 Helen Koike <helen.fornazier@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260219135645.261192-1-eric@engestrom.ch>
 <b7f86ada-a74d-4fb2-83d2-5b4ef18e00c4@collabora.com>
Content-Language: en-US
In-Reply-To: <b7f86ada-a74d-4fb2-83d2-5b4ef18e00c4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92614-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:eric@engestrom.ch,m:helen.fornazier@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[engestrom.ch,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER(0.00)[vignesh.raman@collabora.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25CDA698846

Hi,

On 20/02/26 11:08, Vignesh Raman wrote:
> Hi Eric,
> 
> On 19/02/26 19:26, Eric Engestrom wrote:
>> Signed-off-by: Eric Engestrom <eric@engestrom.ch>
>> ---
>>   Documentation/gpu/automated_testing.rst | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git ./Documentation/gpu/automated_testing.rst ./Documentation/ 
>> gpu/automated_testing.rst
>> index 62aa3ede02a5df3f590b..8a7328aef10ef39ee329 100644
>> --- ./Documentation/gpu/automated_testing.rst
>> +++ ./Documentation/gpu/automated_testing.rst
>> @@ -99,7 +99,8 @@ How to enable automated testing on your tree
>>   ============================================
>>   1. Create a Linux tree in https://gitlab.freedesktop.org/ if you 
>> don't have one
>> -yet
>> +yet, by forking https://gitlab.freedesktop.org/drm/kernel (this 
>> allows GitLab
>> +to internally track that these are the same git objects).
> 
> Reviewed-by: Vignesh Raman <vignesh.raman@collabora.com>

Applied to drm-misc-next

Thanks.

> 
> Regards,
> Vignesh
> 
>>   2. In your kernel repo's configuration (eg.
>>   https://gitlab.freedesktop.org/janedoe/linux/-/settings/ci_cd), 
>> change the
> 


