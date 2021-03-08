Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03315331B22
	for <lists+linux-doc@lfdr.de>; Tue,  9 Mar 2021 00:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbhCHXx1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 8 Mar 2021 18:53:27 -0500
Received: from ms.lwn.net ([45.79.88.28]:37040 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229488AbhCHXxR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 8 Mar 2021 18:53:17 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CBB1431A;
        Mon,  8 Mar 2021 23:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CBB1431A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615247596; bh=COx9eQ5SwNlqiBJ+BSztWogT456RXD+4NDcBY0ituWU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=TsgHNn7Y/YoemeoQVeZuhSzEU4ayQWG2CCnwMo85ZUvHiSWU0R783v12zCA49sZAG
         0/Sblfda4keZp20pHOhOldbcHlOdKdDmEIu0hqOO3BQ27q4QH1xz195Jkg8A8EyJX3
         E57wRm6Nwsdhh8/5ZxjQu2+Fa7TF9/nce8pWEU5wstlgFfiTuw+ZaHzGBG+KOTnvWY
         PWXpZZCBYEL275kb08hiX7/G8j93+C/cpeeD2lUBjSSIPkKj2bwXeIqpEqmemrT8Nd
         prarWufxGSgu+4lHmjE0i4NFu6/Kni+6WFuUTgfIEqJExZVdw/7ZDhGAxmQ+sgWeM6
         BQJPd16jzG1YA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: add a subsystem profile documentation
In-Reply-To: <95af047a293d8209cf80c05be2b31261cf142853.1614862252.git.mchehab+huawei@kernel.org>
References: <95af047a293d8209cf80c05be2b31261cf142853.1614862252.git.mchehab+huawei@kernel.org>
Date:   Mon, 08 Mar 2021 16:53:16 -0700
Message-ID: <87y2ex5hjn.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Document the basic policies of the media subsystem profile.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/driver-api/media/index.rst      |   2 +
>  .../media/maintainer-entry-profile.rst        | 206 ++++++++++++++++++
>  .../maintainer/maintainer-entry-profile.rst   |   1 +
>  3 files changed, 209 insertions(+)
>  create mode 100644 Documentation/driver-api/media/maintainer-entry-profile.rst

This all looks good to me; would you like me to take it or were you
going to send it upward yourself?

Thanks,

jon
