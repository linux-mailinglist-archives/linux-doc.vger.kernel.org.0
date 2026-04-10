Return-Path: <linux-doc+bounces-82987-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBclF+VB2GlxaggAu9opvQ
	(envelope-from <linux-doc+bounces-82987-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 02:18:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D65743D0BF5
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 02:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 980F13019448
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 00:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0A3265CA2;
	Fri, 10 Apr 2026 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kzGfoUtb"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5708122759C;
	Fri, 10 Apr 2026 00:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775780321; cv=none; b=H680kIMCXAKF3KXpFUOwInmbTS+dM7fx4mkHlmDuO0z7VdGeRSwbQJxUAUEWe2CFZ9uqjskKEaWq40ZJS7HJ/owcli7V8tHImYzKUAE+pHRmSo/ozDlg26ph5r5jNtd1qOqFDxWMEfPxdXw8XFcKSJFX49A7RXw55CxaHSH5BYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775780321; c=relaxed/simple;
	bh=YnZsdan2sCk27ohr3umm6f0bl5JJ05TowFYUiiilC+8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=HuE1YEc75/kq+3PL6hdKJyd5GOTW0EWGX2rkrRf2k5PGhte05zthJtDcLiIJVKN0uqmoCOl7Ip/a4uDRpKKVht/O1a5AaWOXyegbdG/HyTb7b9uNNTU8f8+W6cgnY2JWChAOY5pmfje7pNaili6ocgjNqSV1Dmoz7vS9L/O4sGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kzGfoUtb; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Q5S9pQYXXA2rICRxhUUfxrhNFn7H6PPfpMBY2wtBghE=; b=kzGfoUtb6itMfxHfpgHOhOnWOI
	nw1RYDLG0IGZ/r2EPAx+44bTxKjdnkOBvllPlLOywH+ypv74v4AvF3JciRsAFRueL48QSfgfWzVfp
	ibr8gHELIaq9t3uiZCqfg45OI5LjZrzKsluS79bcf+6vAc+OMKcYtrejmmKNT/G5pZixrZ4WmBzI0
	SXnnJtIpIUCGwpaovrmwoQkuEJpTVNADDA9WdcBgurmdLbA0F6gfqYDvS5AcssFIPJJb0dXGUiMG2
	2Qj4jgsjv8EGHTyb0F+Htcy4AjnEaaJT3voK2sK81nk9HIIQLxawQTdrdbnkunj0khJFWCMD5sNlk
	ChvMRrrw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAza4-0000000BMd9-01df;
	Fri, 10 Apr 2026 00:18:40 +0000
Message-ID: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
Date: Thu, 9 Apr 2026 17:18:39 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: maintainer profiles
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	TAGGED_FROM(0.00)[bounces-82987-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: D65743D0BF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Is there supposed to be a difference (or distinction) in the contents of

Documentation/process/maintainer-handbooks.rst
and
Documentation/maintainer/maintainer-entry-profile.rst
?

Can they be combined into one location?

-- 
~Randy


