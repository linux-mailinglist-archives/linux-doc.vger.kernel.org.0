Return-Path: <linux-doc+bounces-82679-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAG3I4EI1WnMzgcAu9opvQ
	(envelope-from <linux-doc+bounces-82679-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 15:37:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F33A63AF42D
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 15:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 371C53028815
	for <lists+linux-doc@lfdr.de>; Tue,  7 Apr 2026 13:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2623B7753;
	Tue,  7 Apr 2026 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bes.tel header.i=@bes.tel header.b="K9cFKZ3/";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="tXXUXlXz"
X-Original-To: linux-doc@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C029C2F60CC
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568405; cv=none; b=d1N7lU1raz6hOkRzaHld0jjSgx7vC5TYoZ1hrv3jNh/+6Bh8hlb38Yy9ae7X5W9XOWzNTZ+cTdhYsfvFGwIs51kTJnsMAOJ1/RjcVrQjbyxuXLNkZXh5boV46ucl53yd2434q7SMaAvaisQIjM9PLRPTry7umAZ2IeEoC3O4sv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568405; c=relaxed/simple;
	bh=c22d6V2u61GovLZpfs8FBVr+t/XEZPWaprwWGg07XzI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MwWuqoZHnwwqm7991D+Ou9OR1V1hNYRc0Lzti50GHsV1MzjCcjpHu6zUFD08Uo2czuvYeQfa5tAjl6aEPkzx5sMttt9wAhid+iezhS1LLIOMszlY02Ru9m4VFgAJIyk5SQ8/d80sPTiVvaJOEdeq++8QxMoJOnh4vLNjxgH9D48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bes.tel; spf=pass smtp.mailfrom=bes.tel; dkim=pass (2048-bit key) header.d=bes.tel header.i=@bes.tel header.b=K9cFKZ3/; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=tXXUXlXz; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bes.tel
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bes.tel
DKIM-Signature: a=rsa-sha256; b=K9cFKZ3/O7h5iU+RCg2td0WSFfSi9rxIN4o4HFrtDyhfF34k1z4+wTzZN+mNq6oK67ShmP4ScPK8O2/sKoAoIJhzczf7MeoLmf2+bFz6m7qKomdQAo+RkLjvnhqAhcRlRO9MniFLK305dJmogL8AlgcYQK4U6cY4jBq2r9FPU1tzc3lU+AGlBeFCnNnUekHljiosI7Y8+GYOpTwOOh+tVkii1FkxruyQTKbR8pAViksMzcKgnfwVVXk9y8y7+22zban+9QDTUMCglOYeXZFMMhtGlB6QwBHaCa6s79bDy3v8GzvH+ulHBe3IkJWOK6eOBuzeW5qghzHi/1a/byCBaA==; s=purelymail2; d=bes.tel; v=1; bh=c22d6V2u61GovLZpfs8FBVr+t/XEZPWaprwWGg07XzI=; h=Received:Received:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=tXXUXlXzcqzitsSZr9rXJpasJgtrHDRAZQtJRJUS8xIXOFOtC7DbAudIZct6fHo2PQcY98YgfYi3nVSEzi7lhU/M+rYUo3Cxyu5AH3Lo78bZWXODTd2l3b/wz2t2OkOjcXC4tKYcJkakWhiES3iGBXqfc8Xm9RfUFzhlXUxeRlqa+ctzeN7eOpu9ZnrE/fxADuujIt5/gaqeTag83t8PoX0waXfrFbBaSOcA/hmPOOtZ5FK1LaERQBu9ZwRrrBK87As2aJN8iOPkhukyFiaKe/gNoL0H6PjVCHV/+CLmh7heOcHYgDt8FOPJZ8w+USD4qo0HsAeHcVdMGtHqgRR/lA==; s=purelymail2; d=purelymail.com; v=1; bh=c22d6V2u61GovLZpfs8FBVr+t/XEZPWaprwWGg07XzI=; h=Feedback-ID:Received:Received:Subject:From:To:Date;
Feedback-ID: 19882:3702:null:purelymail
X-Pm-Original-To: linux-doc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1629212201;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 07 Apr 2026 13:26:06 +0000 (UTC)
Received: from [10.2.161.35] (unknown [10.2.161.35])
	by awak.mobi (Postfix) with ESMTPSA id 9F2F93600E2;
	Tue, 07 Apr 2026 15:26:04 +0200 (CEST)
Message-ID: <0ebbfbc5163806341165be55631c5834a6946aab.camel@bes.tel>
Subject: Re: [PATCH 0/1] Documentation: leds: leds-class: Document keyboard
 backlight LED class naming
From: Xavier Bestel <xav@bes.tel>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>, Lee Jones
 <lee@kernel.org>,  Pavel Machek <pavel@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Rishit Bansal <rishitbansal0@gmail.com>, Carlos Ferreira	
 <carlosmiguelferreira.2003@gmail.com>, Edip Hazuri <edip@medip.dev>,
 Mustafa =?UTF-8?Q?Ek=C5=9Fi?= <mustafa.eskieksi@gmail.com>,
 linux-leds@vger.kernel.org, linux-doc@vger.kernel.org
Date: Tue, 07 Apr 2026 15:26:02 +0200
In-Reply-To: <20260406174638.320135-1-johannes.goede@oss.qualcomm.com>
References: <20260406174638.320135-1-johannes.goede@oss.qualcomm.com>
Autocrypt: addr=xav@bes.tel; prefer-encrypt=mutual;
 keydata=mDMEaBuzUBYJKwYBBAHaRw8BAQdAGHVrbf6OLBOo4PjYPoYLSIOV+u8/rKgFlLM4pk+rj
 eC0G1hhdmllciBCZXN0ZWwgPHhhdkBiZXMudGVsPoiWBBMWCgA+FiEEPYfp8pYhYROehNkEULR9s/
 9K9OgFAmgbs1ACGwMFCQWjmoAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQULR9s/9K9OgeJAD
 /aPp0IPj5ahqo7DGo1Xk8/t7afPAHYMBeV03Fte4f57EBAPKvhRUTyR4+CrPtGERWfoYlxNkp5yKr
 wwkjUbLon1AG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bes.tel,reject];
	R_DKIM_ALLOW(-0.20)[bes.tel:s=purelymail2,purelymail.com:s=purelymail2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,medip.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bes.tel:+,purelymail.com:+];
	TAGGED_FROM(0.00)[bounces-82679-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xav@bes.tel,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bes.tel:dkim,bes.tel:mid,purelymail.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F33A63AF42D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le lundi 06 avril 2026 =C3=A0 19:46 +0200, Hans de Goede a =C3=A9crit=C2=A0=
:
> Drivers which need this are:
> [...]
> 3. Logitech G710/G710+ gaming keyboards HID driver:
> https://lore.kernel.org/linux-input/20260402075239.3829699-1-xav@bes.tel/
> Posted a week ago, needs an agreement on the LED class dev naming scheme
> to continue.

Indeed. I referenced Documentation/leds/leds-class.rst as if your patch
was already merged. Thank you for tackling this !

Regards,

	Xavier

