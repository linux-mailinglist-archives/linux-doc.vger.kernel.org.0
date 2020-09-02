Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F2525B177
	for <lists+linux-doc@lfdr.de>; Wed,  2 Sep 2020 18:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgIBQVA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Sep 2020 12:21:00 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:37044 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726446AbgIBQVA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 2 Sep 2020 12:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1599063659; bh=ja9zNifBYmBVDJo7IzrJpB9djHjjxbZ2xsu5oGiLPAs=;
        h=Subject:From:To:Date:In-Reply-To;
        b=ELsXRndH3+K4jv6dzeOpilxzqNqVjcnhCzCrWCaDEvL8sJYPHCMakcVRfT1Cd0d31
         EpLPLA+mLihZb0sIe9e7zzHn0v0MPAe03M+B5Q48qyOH5J9KconT7G7IUcsHG/QhS0
         Ayb0elMid8BVFF4ajt1Sksj+hFwHEy3+ybOiMFew=
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH 2/4] Documentation/process: expand plain-text advice
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Randy Dunlap" <rdunlap@infradead.org>,
        <linux-doc@vger.kernel.org>, "Jonathan Corbet" <corbet@lwn.net>
Date:   Wed, 02 Sep 2020 12:20:43 -0400
Message-Id: <C5D0R4LY727O.3IVTS5J20WHXW@homura>
In-Reply-To: <022eb995-5d47-c564-af55-239d5c3ab848@infradead.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed Sep 2, 2020 at 12:06 PM EDT, Randy Dunlap wrote:
> On 9/2/20 8:57 AM, Drew DeVault wrote:
> > This adds a link to https://useplaintext.email to email-clients.rst,
> > which is a more exhaustive resource on configuring various mail clients
> > for plain text use. submitting-patches.rst is also updated to direct
> > readers to email-clients.rst to equip new contributors with the
> > requisite knowledge to become a good participant on the mailing lists.
> >=20
> > Signed-off-by: Drew DeVault <sir@cmpwn.com>
> > ---
> > Conflict of interest: I wrote and maintain the website this links to.
> >=20
> >  Documentation/process/email-clients.rst      | 5 +++++
> >  Documentation/process/submitting-patches.rst | 3 +++
> >  2 files changed, 8 insertions(+)
> >=20
> > diff --git a/Documentation/process/email-clients.rst b/Documentation/pr=
ocess/email-clients.rst
> > index c9e4ce2613c0..16586f6cc888 100644
> > --- a/Documentation/process/email-clients.rst
> > +++ b/Documentation/process/email-clients.rst
> > @@ -25,6 +25,11 @@ attachments, but then the attachments should have co=
ntent-type
> >  it makes quoting portions of the patch more difficult in the patch
> >  review process.
> > =20
> > +It's also strongly recommended that you use plain text in your email b=
ody,
> > +for patches and other emails alike. https://useplaintext.email may be =
useful
>
> You could justify that first sentence by adding that some mailing
> lists drop/discard emails that are in html.

Will add this if the patch ends up being re-rolled, but I don't think it
necessarily warrants a v3.
