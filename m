Return-Path: <linux-doc+bounces-95978-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZtefNqOkT2pVlgIAu9opvQ
	(envelope-from <linux-doc+bounces-95978-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 15:39:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9DB731AB3
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 15:39:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=T+MXbyGe;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95978-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95978-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28EAA30089B9
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 13:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3CD2D9EE7;
	Thu,  9 Jul 2026 13:39:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868FC1A3172;
	Thu,  9 Jul 2026 13:39:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604377; cv=none; b=h364o+JpGP8p1gRtzlXOPeCTqI2yfGnY+i9M8atydlMqN/jyy44y4HtxAtLm+RJ8aSDMdLfMpfD10xB8l5BOU3hcpJbo0d5O77AGyOkUe3qP5lUduRcC/hSVaJsttWonZXRV+C0zEIU/ZQoxeGTUZUJ5QTEY6e8x49XRtDnh728=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604377; c=relaxed/simple;
	bh=9ww8n1YsyHedf1sBFjKIUOQec+lcYJ/wBQdsT3hUWtY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dmvUCi2I+s6+1mbYLrtKAXgnaZ7h56pONHnIuG5FWJkerho2mmndGItP2rlv07Bs3cMfM9asENpQPSC8fCHDVEE1sqHUqwBPq89grWqL7EEwcZrI1fmS3hz/Lbho8Fq7y9bMy0Yy80uxwqMPoZ/KUbZxhCJF707MFTKip6XXNyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+MXbyGe; arc=none smtp.client-ip=192.198.163.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783604376; x=1815140376;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=9ww8n1YsyHedf1sBFjKIUOQec+lcYJ/wBQdsT3hUWtY=;
  b=T+MXbyGeSKwYG2MBrKFVvsJ/otRxI1Mr1znGml0hEekfrieYCJZ7kltV
   YFu84x/O8Sc4ADR2qHCZAWxTwwYThiUBG2i+laG4hZ2JakbZHYKHn6smW
   6+UI4xsctA1+BnzI3p71YZCBgV3SsnnnlLT18Y0haKtxzWUHwWiGGkStE
   y8h5OteE3ZKb6dCo9k8vVwqR4CPIVS1DBfdpN5LdEDWFylY7VKqqdfMZB
   WMAFt3CWZL4uwK5MjjUVo0jJnDT3BhKJfkfq3i2rrzyWKqnUrv+boR50W
   GN2BKJbKP6YAznokB7/au6WRZWeLXp6/btur62Ap1lLgSSUDmyUIWFVC8
   g==;
X-CSE-ConnectionGUID: J+0PPiReTBGGjzGjjDP75w==
X-CSE-MsgGUID: NYQm1DcdTXOgrmsDcX/SUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101832718"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101832718"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:39:35 -0700
X-CSE-ConnectionGUID: TxtQrl6/QQam2kZFnMLlkQ==
X-CSE-MsgGUID: dZjOuuA9TbK6RTQC9BVpHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251225535"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:39:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: corbet@lwn.net, skhan@linuxfoundation.org, derekjohn.clark@gmail.com, 
 hansg@kernel.org, Vishnu Sankar <vishnuocv@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, mark.pearson@lenovo.com, 
 linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, vsankar@lenovo.com, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
In-Reply-To: <20260709021504.465792-1-vishnuocv@gmail.com>
References: <20260709021504.465792-1-vishnuocv@gmail.com>
Subject: Re: [PATCH v4] platform/x86: thinkpad_acpi: Add USB-C Security
 (USCS) support
Message-Id: <178360436568.12613.9417666621877155453.b4-ty@b4>
Date: Thu, 09 Jul 2026 16:39:25 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:derekjohn.clark@gmail.com,m:hansg@kernel.org,m:vishnuocv@gmail.com,m:platform-driver-x86@vger.kernel.org,m:mark.pearson@lenovo.com,m:linux-acpi@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ibm-acpi-devel@lists.sourceforge.net,m:vsankar@lenovo.com,m:mpearson-lenovo@squebb.ca,m:derekjohnclark@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ilpo.jarvinen@linux.intel.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-95978-lists,linux-doc=lfdr.de];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:dkim,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B9DB731AB3

On Thu, 09 Jul 2026 11:15:04 +0900, Vishnu Sankar wrote:

> Newer ThinkPad systems expose a USB-C Security (Restricted Mode) feature.
> When active, USB-C data connections are disabled while power delivery is
> preserved. This is useful for kiosk and physically-secured deployments.
> 
> Hardware interface:
> 
> The HKEY device exposes a read-only ACPI method USCS():
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
      commit: 740f324f8f036607d59c05ab2b2fc22231c9641d

--
 i.


