Return-Path: <linux-doc+bounces-78955-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMPdEI6Dsmm6NAAAu9opvQ
	(envelope-from <linux-doc+bounces-78955-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 10:12:46 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB1826F6AC
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 10:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CBE83015D01
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 09:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D403AA50B;
	Thu, 12 Mar 2026 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="KaI3EEoH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F09332EC8;
	Thu, 12 Mar 2026 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773306761; cv=none; b=VRdHwihASGHnKSlYssljvmU4aqnAOozhFWkFcVHQwphPiCJbUcr50jXEdUs+qS43mjf/ceiVRL3NntKJNo4QippvfOW/LWqYrBUYi9Ig7GFhAwRen7rOdnBwwCHqPyLJcMtarxDTBkicaIxYwpSg1HS/fLn30jQJ86XTVYKa2tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773306761; c=relaxed/simple;
	bh=Fi+6NPM8BzrZZFo/UX5v9DrP0PwGv6YPbLG0jj4Qqjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkdbBNyE764GUGXDBCw9sWbV21iuoi6k0+wiPQf5ltp344zOagNFhGR748ucv2Ny4cmbltNs+YVorIOReqWjZbBAH5FXpD7TTehJkW+vTimekzntgGODs+co1v2KQ0lhTk4RPp4MyuvlfqPOmp6VDdmCazq6ZsDOdoDMfj5hzGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=KaI3EEoH; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.24] (i5C75F5CE.versanet.de [92.117.245.206])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id E41022FC004D;
	Thu, 12 Mar 2026 10:12:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1773306751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JczzAwDP82dHJxPs31+E2V6AEvt83c6VOtaXH7YP+nY=;
	b=KaI3EEoH+b4smCI+LmZhczK2qj5J+4CpwWDW6hET3Gs0J8gI3HKUcfj4i722y6lTPRYDvg
	U03XjjET5WD7UbzkmmqjDmZ8ju11iSxJHrMRiWUgqcDvJ+984KpZ9+L/4+dHF0R1/KnVTP
	w6VkXgEC6dIUgV3+op00GA1/mqQ88aU=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <5bb7a2ae-9754-4375-a1f5-ef23916e26dc@tuxedocomputers.com>
Date: Thu, 12 Mar 2026 10:12:30 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] Documentation: laptops: Update documentation for
 uniwill laptops
To: Randy Dunlap <rdunlap@infradead.org>, W_Armin@gmx.de, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260310234022.2085232-1-wse@tuxedocomputers.com>
 <20260310234022.2085232-6-wse@tuxedocomputers.com>
 <363b80db-9bf3-44d5-a756-e64d29bd36ec@infradead.org>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <363b80db-9bf3-44d5-a756-e64d29bd36ec@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tuxedocomputers.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tuxedocomputers.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-78955-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[infradead.org,gmx.de,kernel.org,linux.intel.com,lwn.net,linuxfoundation.org];
	DKIM_TRACE(0.00)[tuxedocomputers.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wse@tuxedocomputers.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gmx.de:email]
X-Rspamd-Queue-Id: 9AB1826F6AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Randy,

Am 11.03.26 um 05:57 schrieb Randy Dunlap:
> Hi Werner,
>
> On 3/10/26 4:34 PM, Werner Sembach wrote:
>> Adds short description for two new sysfs entries, ctgp_offset and
>> usb_c_power_priority, to the documentation of uniwill laptops.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>>   .../ABI/testing/sysfs-driver-uniwill-laptop   | 25 +++++++++++++++++++
>>   .../admin-guide/laptops/uniwill-laptop.rst    | 12 +++++++++
>>   2 files changed, 37 insertions(+)
>>
>
> Can you give me a lore.kernel.org URL or a message-ID in which
> I replied with a "Reviewed-by:" tag for this patch, please?
> I don't recall doing so, but I could have.

Thought you did go through it because you gave the spelling corrections,

Sorry I can ofc remove it again.

Best regards,

Werner

>
> thanks.

