Return-Path: <linux-doc+bounces-93006-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WttECr1ON2qOMQcAu9opvQ
	(envelope-from <linux-doc+bounces-93006-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 21 Jun 2026 04:38:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE456AA03C
	for <lists+linux-doc@lfdr.de>; Sun, 21 Jun 2026 04:38:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rcpassos.me header.s=purelymail1 header.b=CP7fxgf6;
	dkim=pass header.d=purelymail.com header.s=purelymail1 header.b=H5vpB+fW;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93006-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93006-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=rcpassos.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D172D30041DF
	for <lists+linux-doc@lfdr.de>; Sun, 21 Jun 2026 02:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236C71FF1DA;
	Sun, 21 Jun 2026 02:38:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47FC1E5207
	for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 02:38:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782009530; cv=none; b=HNWoMGVX6baXlu/6Xwdd4UOXC/tc53r1JHIcmECjd/EAT3oUDOB6zEs0ppjBJZuVLh/0e6LE1XM8AWBH9MBVKjulzFIzUXB08LvISmVrNeyNtozFrkb3nH7FllyYH3v8aMyAY0Lfq6o50fyQKLBT9LtdcYez3g2EdHQ/9xCwVdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782009530; c=relaxed/simple;
	bh=SPVmQ9fNFBABZI8jZMi8NBZ5MhRj5jey5MMNSapEE2o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EP6jtBqPaDyH4ax97nN60IdCjTpaPeeVXYhXfmToPMfM+Du6jxrR7w9Wb/TNefKKVXtHnor7AKDKbN0hgsC5aJDQW1uodJHUKCoefRh+35xqSmMe21KBobRg9y6n5hQMcsz4c0MhpJibZA05v5eYXIndK9y6RFOxi5s5Ff5DHGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=CP7fxgf6; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=H5vpB+fW; arc=none smtp.client-ip=34.202.193.197
DKIM-Signature: a=rsa-sha256; b=CP7fxgf6LJOy9v2xBGXqOxMFjPLRgfzxFw3tgZGmQKDBD311KTu6noXM6ByAJitmtAH5tWtngFIRzhTCGJdc+Aj0je4hNwMpeZ+fsQ40E/VNQwK/HyNVEXTd3VUcUjczlnBr5C7X8uWIht1mUQtCGrA178HmIy5LaHwoyOKHCpCJ/bZR/2+68CAgx0WLHG1/vsKweyzSnnH0EOhwxiW9l3TTvjH7s3moe2oPytGXpw+INlm+2jPUwXxjo+g899tlz4EJxVEq7zVx5UPeLBsHGfn3NXDYzJ2p+Ma5YsQ2ALpIYaQhz3WbkwPO65KP20ONaCEgzlz+uylNmSWdmaYemA==; s=purelymail1; d=rcpassos.me; v=1; bh=SPVmQ9fNFBABZI8jZMi8NBZ5MhRj5jey5MMNSapEE2o=; h=Received:Date:Subject:From:To;
DKIM-Signature: a=rsa-sha256; b=H5vpB+fWENsIH+J0IVSTsqNWs0JfvU8BLch27gjAwH2Ca6CuQbKz3C5L6EdTOwuC4gOcjWuBz6bPo2rCUPVxHgCiJ917u7dk3K8rwddR1snXYCRAra0heBXqmNx7EFVB1VZJKOvEvNja46Ubff+DRpjHCimq7dntEyVFWkYOMYqTKZtiQVisYT+5ZNfVZuYnhibDsplgzH2y2N2871l56Xpg6+12Bu6pz/bABRl+tIK7xvE7n3a0xASEQFd+QtwA+bbj9NyrRJWRo/TOC5H/sCrX0SBIJul7xIk2wGsWsG2PkM3wt+Jfzt8UwBqeomZjLrw8dPAZLD3DvtFk+oId7Q==; s=purelymail1; d=purelymail.com; v=1; bh=SPVmQ9fNFBABZI8jZMi8NBZ5MhRj5jey5MMNSapEE2o=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-doc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -665510756;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 21 Jun 2026 02:38:30 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 20 Jun 2026 23:38:34 -0300
Message-Id: <DJEDNH9TR3ZE.QO68KQ89RX4O@rcpassos.me>
Cc: <corbet@lwn.net>, <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/3] Documentation: xe_drm: fix chars used for
 subsection
From: "Rafael Passos" <rafael@rcpassos.me>
To: "Randy Dunlap" <rdunlap@infradead.org>, "Rafael Passos"
 <rafael@rcpassos.me>, <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260620201732.94141-1-rafael@rcpassos.me>
 <20260620201732.94141-3-rafael@rcpassos.me>
 <4130fd7c-6f7c-4b03-ad64-7a738e2f0bc9@infradead.org>
In-Reply-To: <4130fd7c-6f7c-4b03-ad64-7a738e2f0bc9@infradead.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rcpassos.me,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[rcpassos.me:s=purelymail1,purelymail.com:s=purelymail1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93006-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rafael@rcpassos.me,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:rdunlap@infradead.org,m:rafael@rcpassos.me,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rcpassos.me:+,purelymail.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@rcpassos.me,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CE456AA03C

Hi,

On Sat Jun 20, 2026 at 6:42 PM -03, Randy Dunlap wrote:
> Hi,
>
> It would be helpful to include the warnings here (but maybe not
> all 10 lines of each warning).

Ok, I will add them.

> scripts/get_maintainer.pl should have told you that. (It does for me.)

It did, but I made the (wrong) choice of sending it only to the docs
list, beucase I had 3 patches with nothing but doc fixes.

In cases like this, should I:

1. send a patchset, including the maintainers only on the patch related
   to them ?
2. send the patchset including everyone involved ?
3. not sent a patchset at all, and send separate patches for each list?

In this case, the other two patches will be dropped. So I will send a=20
V2 for this one, and for the correct audience.

Thanks Randy,

Rafael Passos

