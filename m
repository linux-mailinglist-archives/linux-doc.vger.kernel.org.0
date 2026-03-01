Return-Path: <linux-doc+bounces-77456-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL3qJebBo2lSLwUAu9opvQ
	(envelope-from <linux-doc+bounces-77456-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 05:34:46 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 417D51CE857
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 05:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97F0D30039B3
	for <lists+linux-doc@lfdr.de>; Sun,  1 Mar 2026 04:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4A02DF6F6;
	Sun,  1 Mar 2026 04:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cyberialabs.net header.i=@cyberialabs.net header.b="CX7/RfP2";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="o/6hPLLR"
X-Original-To: linux-doc@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E2A1F09A5
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 04:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772339683; cv=none; b=cSj9dBd2nLVqd8bU2dTmP2aMvETT7b/Hig3EBpFOVZxEknPO2cnpomI2L3tNNwhVOTnNEs3Jnee6qbzMvAkAJUKjHGRvvCoQVYWdyeO/pMcuvZHBbHFaPmB3bXptXmcJaL8YHYNZJbyfeYCeO6ggy5mnDrGwtnfxel/WJAHGzCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772339683; c=relaxed/simple;
	bh=LlLy8cuuiUGgzMjbWQvuAn4Cd8OuStyOFO8/rF8qmPg=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type; b=jEkZMiIiIim1gHbOGXMZPq72F/LbZ+JVpadeTD0OdBlF3L7LfkiXGNX5+Rl53PqTTbaGFAvSXc/lk/5fDH/mAad6W4qHT7JhnRF0Xal4XjWryHNAQYKpz5lhesPPWk+c1cXGGy9MdBH33G9Zv29LKHFeFgTSxwOK+r7U+l7nGsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberialabs.net; spf=pass smtp.mailfrom=cyberialabs.net; dkim=pass (2048-bit key) header.d=cyberialabs.net header.i=@cyberialabs.net header.b=CX7/RfP2; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=o/6hPLLR; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberialabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberialabs.net
DKIM-Signature: a=rsa-sha256; b=CX7/RfP2aMAJAWscSHAE2+O+510Q3T4MvH/pUHBJsyPQvBdVrpHADRtdRXeEYK3s8VPD2R98k/v+KqyjG9LPbEoRVd15gcn4Zwp6cHNiS96FpH999Y0KNd4MDYOF22GXXXXhnqGwakILUjXoG62ah/wYT9osxqm2IB0RDEkFBURzw2guzi2tKB0lPUZR8FOkT/hL09TdoQIqmAXfk+KxpRGi8GXjsQQu4Nl1KhvW5dqMRBZw0PqouazU3axD9DszKjKwozLsADAZAOxzHSUSRu+Owk0BWfmSaozFL2kkPTAodJnMPwaGBPllMjPI9nFWVsQMqS+IRRrSUdGHWlWK+w==; s=purelymail3; d=cyberialabs.net; v=1; bh=LlLy8cuuiUGgzMjbWQvuAn4Cd8OuStyOFO8/rF8qmPg=; h=Received:Date:From:To:Subject;
DKIM-Signature: a=rsa-sha256; b=o/6hPLLReS5GKKxrBBUedGcSGco667SR8CyWMwxxWmPaR3O/qEQZPaXM6N2gQmNUxT24UFyKhd7E/u4clLkxYiC45CS8TjXWaLiLOZY5NKCEZV1pJgnXe6LFCp3ugUWav6jU1jswLkoFgIQvf+ig9yi4VReOS8uPW2mj+Lcft6elSvFm6NGdO5E/Vjc+R7SmP/poFEgJNVHrwPctmmoMHPCO8VBBesE7kG/36aG3dEZlDZpsRJM4MHsyqxEseOMhMV5TUKcKfaou+I74/lTH7ORBKtQJaD3VatCzotAtzG16LgvR/FUVUmU8rvCIjWA/j8+48MKjyyI1UYUsxWenhg==; s=purelymail3; d=purelymail.com; v=1; bh=LlLy8cuuiUGgzMjbWQvuAn4Cd8OuStyOFO8/rF8qmPg=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 6229:1532:null:purelymail
X-Pm-Original-To: linux-doc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPA id 582556439;
          Sun, 01 Mar 2026 04:34:37 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 20:34:37 -0800
From: Alexander Coffin <alex@cyberialabs.net>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: KCFLAGS vs KCPPFLAGS for -fdebug-prefix-map
User-Agent: Purely Mail via Roundcube/1.6.11
Message-ID: <b8dfe7035d19fd611b9be55ee3145fdb@purelymail.com>
X-Sender: alex@cyberialabs.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cyberialabs.net,reject];
	R_DKIM_ALLOW(-0.20)[cyberialabs.net:s=purelymail3,purelymail.com:s=purelymail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-77456-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@cyberialabs.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[cyberialabs.net:+,purelymail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,cyberialabs.net:dkim]
X-Rspamd-Queue-Id: 417D51CE857
X-Rspamd-Action: no action

Hello,

 From personally building the kernel a few months ago (reproducibly) one 
of the parts that was incorrect in the docs was that is says to use 
KCFLAGS when you should use KCPPFLAGS for the following. I had forgotten 
to report this until now and I'm not sure exactly what is expected to 
make a patch to the Kernel docs, so I am hoping someone else can do the 
probably one line fix (or maybe 2 if you count the other reference to 
KCFLAGS in the file).

> When the kernel is built out-of-tree, debug information may include
> absolute filenames for the source files.  This must be overridden by
> including the ``-fdebug-prefix-map`` option in the `KCFLAGS`_ variable.

from `Documentation/kbuild/reproducible-builds.rst`.

Regards,
Alex Coffin

