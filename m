Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A4425CC77
	for <lists+linux-doc@lfdr.de>; Thu,  3 Sep 2020 23:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbgICVlK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 3 Sep 2020 17:41:10 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:40202 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgICVlK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Sep 2020 17:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1599169266; bh=5uP5ZKLKbvdASSHmEZmKfkmbTnL32cXrZoiL7dnaoPc=;
        h=Cc:Subject:From:To:Date:In-Reply-To;
        b=xThPzY8nBUFhC+D19UaaornEhaX7RqGlhzwphcSXmytEN9+mRlSnaStzN6PdmUGgn
         K8ScEVwIsvq6JLjKs+MDfxDDzHsJz9EfNyDp8+pV98rZS0hIE4q6hpxiQvexqEmx1M
         JlPZLJJW0Y7UXWKM4jN6jYdxAS6bdHhFGbSbbt0E=
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Cc:     <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] Improvements to submitting-patches.rst
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Jonathan Corbet" <corbet@lwn.net>
Date:   Thu, 03 Sep 2020 17:40:48 -0400
Message-Id: <C5E26QT3RD90.2S03QMRN3QQ6X@homura>
In-Reply-To: <20200903154031.0faded85@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu Sep 3, 2020 at 5:40 PM EDT, Jonathan Corbet wrote:
> Indeed it is - applied, thanks.

Cheers!

> One little thing: it would have been good to keep Randy's Reviewed-by
> tag for patch 2; I poked it in.

Will remember that for next time. Thanks again for the reviews!
