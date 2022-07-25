Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9FC58009D
	for <lists+linux-doc@lfdr.de>; Mon, 25 Jul 2022 16:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234756AbiGYOTi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Jul 2022 10:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbiGYOTh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 10:19:37 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6BCFD3E
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 07:19:37 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id q22so5338565pgt.9
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=WKFNDFAQil/gfMzq3J7KaiiRZuTdNkHEG08Ff3jZJBQ=;
        b=eealeWhZAt0BWryuITEkupZFoqG0tddOvCC/nZzJURQVaMFjfkV50FMIPz8hbN53lG
         S1VD1f/rExWtQ467C6ktTozGoU5lCyKNEljjfH27jepJhG0jNEuqbtLTZXDLv7vSVymw
         n0rtpvvGS8RmgS+tBGToReyC0h+KalUL6pkFUpDi9RfgSy533dIofUSTfp1EPOrR4DVb
         fd5eaxnlpL+Bo3lu2ViTRGiVF7nGY6soNX6rYe/zsXSKsnKhmZul36qepRhaysgwtYsi
         /vF7owUySGFfv+nFLn17PEndYqEoSCLSAQBQ+Ng3FFmLOagw16yHQ/zjmNWcoAzhm/Ra
         HziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=WKFNDFAQil/gfMzq3J7KaiiRZuTdNkHEG08Ff3jZJBQ=;
        b=tKuRQPVQFnNQ+S6RZbb2oN7RHIcvRL9xQaCVqPZc7YIWw+oM6mUkOFwHK2Pdc+3fKm
         LK009IXi7+v38xGP1RJC2/lbVeC2Ag00yg726ZIzA3XpgFKu71fxwo7JByqO10fU1+hN
         c4WJkE3RNmssljkdPIjK+MNyI0cVis7VdWM3F0IB+UcMHRWkor2YZikCtzzInJzsy45s
         8EOAL4Q3+w8Ndho27ZnMflxO7HC/TFcrY3iBpeylvRYZ5jQucaEePOK/nGUSRw8Zjrv7
         +kyvKkae6Xxa7YzQG+VIR2VHRHcFGqWQlLyfJ/XYem22A4nAB1uHZT9G7NT/h65r7ttT
         t9BQ==
X-Gm-Message-State: AJIora+ecGW5O4k+IEqQ9hjxeq2BytxbIWWDD1r79XRBPLPKb8Kj1x0w
        fG2OcQHpaB0RE6lcVpK/DSh7QjdgHnz6wd56AoA=
X-Google-Smtp-Source: AGRyM1u6u05CsfCl9+pmtADBKRFRdxpqBWAiOt1ly7UCiK9fizIcwYQUw6XPOFrp9QhXdockLDfQ/XHlaP/Db7+RsAE=
X-Received: by 2002:a05:6a00:1daa:b0:52a:c51d:d36a with SMTP id
 z42-20020a056a001daa00b0052ac51dd36amr13028965pfw.61.1658758776449; Mon, 25
 Jul 2022 07:19:36 -0700 (PDT)
MIME-Version: 1.0
Sender: chrisdickson200@gmail.com
Received: by 2002:a05:7022:658f:b0:42:ceb4:ab0 with HTTP; Mon, 25 Jul 2022
 07:19:35 -0700 (PDT)
From:   Chevronoil Corporation <corporationchevronoil@gmail.com>
Date:   Mon, 25 Jul 2022 15:19:35 +0100
X-Google-Sender-Auth: 6XFXJ9_n5s6tnMnE2t3TOMLGKgU
Message-ID: <CAHw_d8Y+=weX5ZwPa+o+K1=9zkrKJxaJVbA2X4T8UP1nMf__2w@mail.gmail.com>
Subject: reply
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

BEWARE, Real company doesn't ask for money, Chevron Oil and Gas United
States is employing now free flight ticket, if you are interested
reply with your Resume/CV.

Regards,
Mr Jack McDonald.
Chevron Corporation USA.
