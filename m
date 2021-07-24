Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F199E3D49B7
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jul 2021 21:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhGXTPe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 24 Jul 2021 15:15:34 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:42317 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhGXTPd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Jul 2021 15:15:33 -0400
Date:   Sat, 24 Jul 2021 19:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1627156562;
        bh=pxqRkzzLhmTqyBKQ5WwSbPXJ+AFQX2JF/ctY7YBtGJY=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=j4+t/PiCYVT3poMORPBqlxVYuy9AZ69VX61aHnFPgx0uGWCI6TfJM6qp9iJiEVRjM
         OBd2k2zSwnXkBNNiC9XUScdxHZ2x1KIaMZo0q5oW7twwLECg9pEt35mLqu+ZqJE36V
         qliPcV8oswezT4hgOJVCtWqlc6sc3lMvxSQRImkc=
To:     "corbet@lwn.net" <corbet@lwn.net>
From:   pioneer695 <pioneer695@protonmail.com>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Reply-To: pioneer695 <pioneer695@protonmail.com>
Subject: make cleandocs issue: rm -rf /output when obj not defined
Message-ID: <hMV_L3bAsgmBToxsfiYBJDxTBoLHll-1BOk7FvqialjmZFNDp14Bq69ddTVagVH49yViCM43-yFpZ39Kfr6geVK7ota0QhCDA4MaC_5vILY=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.7 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In an attempt to get some readable documentation I cloned the git repositor=
y
to check how the PDF format is.

Entered Documentation and proceeded with:

=09make pdfdocs

which failed, so to start fresh, my thought was that:

=09make cleandocs

would be the next step before anything else. But, this resulted in:

=09rm -rf /output

as $(obj) for some reason was empty.

Makefile for Documentation has:

=09BUILDDIR      =3D $(obj)/output

=09cleandocs:
=09=09$(Q)rm -rf $(BUILDDIR)


This should (at least?!) be:

=09BUILDDIR      =3D ./$(obj)/output
or:
=09$(Q)rm -rf ./$(BUILDDIR)


Best regards,
