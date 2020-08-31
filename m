Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8B1258449
	for <lists+linux-doc@lfdr.de>; Tue,  1 Sep 2020 01:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgHaXEI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 31 Aug 2020 19:04:08 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:57292 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbgHaXEH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 31 Aug 2020 19:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1598915047; bh=OFoNm9JTAPDRV0Buvs+ATuGcgyShIvQx0V1H5bfZoNY=;
        h=To:Cc:Subject:From:Date:In-Reply-To;
        b=G9Qy7xALw+e3x2wNto/dpn7VB5QbYfuX2hErJx8Q+U1+gg4TsDao5jo9b3bhg+/9P
         pNvBY8TffJe4tpGYy1gLMcqDmoKF2YJGXeT3FgNBsszJ/HhN1syzBOlHbJzPXVWER9
         Lh/M2hASKhj6Y6cm6kpAFCrJDyCoBIcrHxtPYbJY=
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
To:     "Jonathan Corbet" <corbet@lwn.net>
Cc:     <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] submitting-patches.rst: streamline for git usage
From:   "Drew DeVault" <sir@cmpwn.com>
Date:   Mon, 31 Aug 2020 19:01:51 -0400
Message-Id: <C5BK160QTFK2.1M3TL4ZI5HWW3@homura>
In-Reply-To: <20200831162641.16e90bb8@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks for the feedback!

On Mon Aug 31, 2020 at 6:26 PM EDT, Jonathan Corbet wrote:
> - We have a document on configuring email clients for use in kernel
> development; we should be pointing there rather than to outside sites.
> There might well be a place for a pointer to useplaintext.email in
> Documentation/process/email-clients.rst, but that's a separate patch.

Yeah, I was wondering if this'd come up. There are an awful lot of email
clients and keeping an up-to-date list of instructions for configuring
plaintext is unfortunately an entire project in and of itself.

Will move to email-clients.rst in a separate patch for further
discussion.

> - In general we've been removing manual section numbers for the reasons
> amply demonstrated in this patch; maintaining them is a pain and, once
> you've gone through and changed them all, referring to sections by
> number doesn't work as well anymore. My own feeling is that they should
> come out.

Should this be split into its own patch?

> - Please don't just remove maintainer information like that. If it needs
> a new home, fine, find a new home for it. We have a nascent maintainers
> manual that could certainly use some help.

Totally fair, I'll look for a new home for this info.
