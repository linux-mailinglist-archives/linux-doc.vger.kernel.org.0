Return-Path: <linux-doc+bounces-87676-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKCoKeQwB2oQswIAu9opvQ
	(envelope-from <linux-doc+bounces-87676-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:42:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDDF5519CF
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41D9A301E7F0
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 14:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28F93B52F8;
	Fri, 15 May 2026 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Qmqj3uWK"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0173B636C;
	Fri, 15 May 2026 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778856142; cv=none; b=LwxfUkYdCcLipgo+6eLBvf+SA1OFMRy8jxEk/RzJ3OTEXBKQo3Wev9rG5wEyY3MIrhIQel4eK1LSpoX4ENf1R4uIoXfecLgfGeSaAAzDOK92P36F7NIdpKRBKHMA6nugc7QUyFsvfNcFtvJ8HjXsTzGPf2vQ0xEztLsos5FN9qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778856142; c=relaxed/simple;
	bh=91/MUJntMig6shlSdAm3Ao6hWgk5tAskd8lknBNlwE0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OE9OXy5kuW9HcfZb9LITnO4ec7iCEu3zKCSG7j3fLobvkHu+IjW49WfdwZxOB0hgt5Z/R4ViCpAHRO+mGSsZV8oTufkQg/nsOkOw4eAeKHDDpZM4SW8Fc7PvbfwWQGiz3GrWWgAuTNLyqLbRAhK6Myq2599rddJdMpEGyj/kw30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Qmqj3uWK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 16C05410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778856139; bh=eLCsVAMGqk1U7q51Akbtvr3X5ibRmVt2uWXhRXhFtPo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Qmqj3uWKKo9R1BtTyzT3TELCwi9u+qiDWVP40YonRVnSFSgY+vl898/UjHm3bioPR
	 BMYThWqq/p5Pd9x944lBEcsSVTFvCI55gwohRXE1lRmGJAbkn+Tr3pN5JySZUMv2mW
	 IMpQ2EULLtzhQTeO2Vbyz67AVNN/JuVvmDwARtz7BSzwBF6zR+gRf9v670XOVdDlET
	 DSwYGsXr/Y5wKUk1GgTEQs+sOvSK7rz/+Db3KLwpzwh7oEOeBBsNysU6GxvGnNITG+
	 n2nSICM/KaAFKddHX6kXEYMKzblTWnkk3guTqYvj4W1cu4JimnEyp2D96JTAUyFy5Q
	 Tnr5pUELptAIw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 16C05410B5;
	Fri, 15 May 2026 14:42:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shuicheng Lin <shuicheng.lin@intel.com>, linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4] scripts/kernel-doc: Detect mismatched inline member
 documentation tags
In-Reply-To: <20260507023232.4108680-1-shuicheng.lin@intel.com>
References: <20260507023232.4108680-1-shuicheng.lin@intel.com>
Date: Fri, 15 May 2026 08:42:18 -0600
Message-ID: <87o6igpwdx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: CBDDF5519CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87676-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim,intel.com:email]
X-Rspamd-Action: no action

Shuicheng Lin <shuicheng.lin@intel.com> writes:

> Add validation in check_sections() to verify that inline member
> documentation tags (/** @member: description */) match actual struct/union
> member names. Previously, kernel-doc only validated section headers against
> the parameter list, but inline doc tags stored in parameterdescs were never
> cross-checked, allowing stale or mistyped member names to go undetected.
>
> The new check iterates over parameterdescs keys and warns about any that
> don't appear in the parameter list, catching issues like renamed struct
> members where the documentation tag was not updated to match.
>
> This catches real issues such as:
>   - xe_bo_types.h: @atomic_access (missing struct prefix, should be
>     @attr.atomic_access)
>   - xe_device_types.h: @usm.asid (member is actually asid_to_vm)

Sigh ... naturally this adds a number of docs-build warnings, but they
do seem to be legit.  So I've applied it, thanks.

In the future, please copy the maintainer(s) on your patches;
scripts/get_maintainer.pl should have told you to do that.  I almost
missed this one entirely.

jon

