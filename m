Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3719255A2E
	for <lists+linux-doc@lfdr.de>; Fri, 28 Aug 2020 14:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbgH1Mbv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 28 Aug 2020 08:31:51 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:49410 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729373AbgH1Mb1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 28 Aug 2020 08:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1598617885; bh=SpsMbmscgm8+Hox2YZmY1fIw+La4ndA1aSnFTjNpENo=;
        h=Cc:Subject:From:To:Date:In-Reply-To;
        b=Akuaq03TCfKd4sKJTBRLzIkN/0+P42fVfb5qaWtJjsClKbkyMEVE9o/0q/LiZJSqT
         gOjpzXzKgvtCp/2H3tG8yYd8dH2Mene82Oi4ocAEU59gSgx7JQOShDl2Y49+xlY4CS
         Q5uJnAdRFDcfbzJw6vIseMgx+j3HAkBB7VimUsiA=
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Cc:     "Drew DeVault" <sir@cmpwn.com>
Subject: Re: [PATCH] submitting-patches.rst: streamline for git usage
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Jani Nikula" <jani.nikula@linux.intel.com>,
        <linux-doc@vger.kernel.org>, "Jonathan Corbet" <corbet@lwn.net>
Date:   Fri, 28 Aug 2020 08:31:00 -0400
Message-Id: <C58MQIQSGGUI.1I8IVCR8DPW0C@homura>
In-Reply-To: <87y2lz3xwe.fsf@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri Aug 28, 2020 at 5:47 AM EDT, Jani Nikula wrote:
> > -2) Describe your changes
> > +1) Describe your changes
> >  ------------------------
>
> I suggest just tossing the numbering altoghether while at it.

Because there are so many headings, I think the numbering is still
useful for being able to easily refer to a specific step when asking
questions.
