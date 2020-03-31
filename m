Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6033198EEA
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2020 10:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbgCaI42 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 31 Mar 2020 04:56:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:49344 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgCaI41 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 31 Mar 2020 04:56:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4E22FAE12;
        Tue, 31 Mar 2020 08:56:25 +0000 (UTC)
Date:   Tue, 31 Mar 2020 10:56:22 +0200
Message-ID: <s5h7dz09a2x.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Thomas Hebb <tommyhebb@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Kailang Yang <kailang@realtek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hui Wang <hui.wang@canonical.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Jian-Hong Pan <jian-hong@endlessm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Sergey Bostandzhyan <jin@mediatomb.cc>,
        Takashi Iwai <tiwai@suse.com>,
        Tomas Espeleta <tomas.espeleta@gmail.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Properly fix headphone noise on the XPS 13 and other ALC256 devices
In-Reply-To: <cover.1585584498.git.tommyhebb@gmail.com>
References: <cover.1585584498.git.tommyhebb@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 30 Mar 2020 18:09:36 +0200,
Thomas Hebb wrote:
> 
> 
> The root cause of various pervasive audio problems on the XPS 13
> 9350/9360, mostly relating to the headphone jack, turns out to be an
> undocumented feature of the ALC256 and similar codecs that routes audio
> along paths not exposed in the HDA node graph. The best we've had so far
> to configure this feature is magic numbers provided by Realtek, none of
> which have fully fixed all issues.
> 
> This series documents the "PC Beep Hidden Register", which controls the
> feature and which I've reverse engineered using black box techniques,
> and uses my findings to hopefully fix the headphone issues on my XPS 13
> once and for all.
> 
> Changes in v2:
> - Change fixed value from 0x4727 to 0x5757, which should behave
>   identically, on advice from Kailang.
> 
> Thomas Hebb (3):
>   ALSA: doc: Document PC Beep Hidden Register on Realtek ALC256
>   ALSA: hda/realtek - Set principled PC Beep configuration for ALC256
>   ALSA: hda/realtek - Remove now-unnecessary XPS 13 headphone noise
>     fixups

Now applied all three patches.  The patch 2 had an incorrect Fixes tag
(pointing to the stable commit instead of the original commit) so I
corrected locally.


thanks,

Takashi
