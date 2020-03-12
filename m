Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8514B1832D6
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2020 15:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbgCLOXW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 12 Mar 2020 10:23:22 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43440 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727669AbgCLOXW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Mar 2020 10:23:22 -0400
Received: by mail-lj1-f195.google.com with SMTP id r7so6637805ljp.10
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2020 07:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Dt+A0XYoM4z0Muyh4Z1oK3OQIHOd+TenS7WS4Spt8M=;
        b=kPO+ikxEgegYspLtVJSTdDZGCrznn2iZHcCDSpipCfIKchWvbMXImnOGvH1GmkJfoD
         KcE6fvz9RgDqdCcl4OhN7O0CjnJ+M6liGFX7kS02szV8Mo1+CU8jkrhYkKZ+cX6rh0Qw
         H/nnJeTMB5ClokfZT4zcoYejI5wYd4XBiBYB1T5WDgosR4K8w/H85ETqh8BS+y3N6LvM
         5Y95Pb1xYZfEjIrgLVRhecU/tTp74SEk3Ps55TNUzCeR9gXSB6amj6Kc+BpjDlZq6zaG
         WIiIfQNErmoQIOMBgKTJD8wyx6zy8TH+bDi310hmLvyph1kUIo4otwnn+KNf7P9k3532
         g2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Dt+A0XYoM4z0Muyh4Z1oK3OQIHOd+TenS7WS4Spt8M=;
        b=cKn93rsQ7OtuuYiM7SwzEsKbGuzr7mpTd/V2dyRzeE+WvVV9kaR4coRoOidkLN4XG7
         4mXi1BD2yUljW7c/XsABChWEuQocoT0NYV7WI1GaF9+FSa6rDNCEGCgx9CK6ZXsy0B4z
         ol/jwF3wdZ3t0/Xh7tbNcyT0nM9CD+gwB8mvkJxGt+hXG5ClN8qABCunv4+2xqdxkBq0
         C3tXP9Z4JOA/5ASPp6DtuJBlRg04w7FT6Q+4mcD+JCakyH6LFjElsH6puc9jV5EXlANH
         0wGi/e+IjNAZ4gHym7vlyw8io7iB5KE1b5a8tqa1vfTO/gGu05pBqlSrUQv5w45xPY8K
         xLnw==
X-Gm-Message-State: ANhLgQ0XVHWZppeCWyZhaexOOV8ETvr5Jp+hfHD1P5VT6EMgUuR7+b0P
        a0xP4RR7PMZVdYbhp9gnisQrWMJreLsHIggo/7+n6Q==
X-Google-Smtp-Source: ADFU+vv7LNhuqWt6huv0FXgE1q4FBl/D6hN2gAx1rsopSHV4jlVMS8grUwQme6vafr3oWKM7JsBOgEJp0guAr/W7u10=
X-Received: by 2002:a05:651c:2049:: with SMTP id t9mr5600275ljo.39.1584022999468;
 Thu, 12 Mar 2020 07:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200218151812.7816-1-geert+renesas@glider.be> <20200218151812.7816-2-geert+renesas@glider.be>
In-Reply-To: <20200218151812.7816-2-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 15:23:08 +0100
Message-ID: <CACRpkdZGKB9opaOFT8Yz-tfE9vcCVeF9EvvBi7jWWuAAh3C_FA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] gpiolib: Add support for gpiochipN-based table lookup
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 18, 2020 at 4:18 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Currently GPIO controllers can only be referred to by label in GPIO
> lookup tables.
>
> Add support for looking them up by "gpiochipN" name, with "N" the
> corresponding GPIO device's ID number.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Just like with patch 2/5 I have the same problem here that
the commit message doesn't state the technical reason why
we need to change this and support the device name in these
tables and not just labels.

(Possibly again I will realize it...)

Yours,
Linus Walleij
