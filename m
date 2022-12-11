Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAD4A649537
	for <lists+linux-doc@lfdr.de>; Sun, 11 Dec 2022 18:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbiLKRRN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 11 Dec 2022 12:17:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbiLKRRM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Dec 2022 12:17:12 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC173E0C3
        for <linux-doc@vger.kernel.org>; Sun, 11 Dec 2022 09:17:10 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bx10so9793783wrb.0
        for <linux-doc@vger.kernel.org>; Sun, 11 Dec 2022 09:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25obtB31DDlgLRXlLw15qHeqkAUXlEcFvDhBX+iWq9A=;
        b=bUDUSB5wUoV2dFpy9KiRRKokkq2yJk2aJvYPoiMGSGge+qi4f2NMDPDTTFaMmRIzAq
         VAxjfIFI6S2TV7UEZbPtzZFt027JqZkwynQRx9RHWEYHo/ejplJFTqp98OBkhRc3pyXu
         uQIfGyZw11i76XJfyUXxtef/Y5LBiBxI/XAc81YtBjWphnV9w5RpHOxbgCQABsZoJQih
         O/w949UMVwQAV5bdAqJYuGV3VTZFJQic6Qo6HgVD4gCYHgqNHIuri4TI9C6edLZbKb4C
         OpdN54vLLoeTUvY8phACXgACOwbd2pk3PiK9BvD9ZmNCjrdhCpsB1E6Px+MIPN5e4mjS
         6AHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=25obtB31DDlgLRXlLw15qHeqkAUXlEcFvDhBX+iWq9A=;
        b=EKGLOXXNzCkBlMvomIZCctIH8SXwRktB2Lfpmpiws7d19WP8tjIgRbdqLdE3IxgHui
         H99ibPAbXjjW3fJQ4R+qNiBLjuUD/oMoreh9ZBnDIB7cvyN1OhjeUV4f4ZWpfN22PCOJ
         wyz9qfahwq6J78jW+w7U+DQDDytIUXtAC/m/F7KBzDuNiifyRiONpbq+dhPddvf55hYS
         JBQ0lH/n359BmvNohqrRz0x82nJenKr0QHwohD2XLuJwnMVIhW4nfHWmFK+U2Z9yviDB
         JHZxzx4kp5PyTAmuiCotC4mlvGLNYi1c5Wg3sBSsmMkmWWpUeG98XEoQEqPL1C66mM+h
         wLxA==
X-Gm-Message-State: ANoB5pk6DAVyZ85Y6aX61lmPdBAkNvqDdx20320OEoNKBiVD/ZWu7AHk
        snPSDe4Qp0MPY6irj7PZY2uLuuL7uT1BbX/OKZs=
X-Google-Smtp-Source: AA0mqf7XEtWgrGuuHxu9pbCGz/rwhjJocgJpm28JalIGing9H5aWE7aCJffPecJndQhq17NleTTj5tEOLbUYRJ/fmzo=
X-Received: by 2002:a05:6000:705:b0:248:443:2e99 with SMTP id
 bs5-20020a056000070500b0024804432e99mr456084wrb.52.1670779029191; Sun, 11 Dec
 2022 09:17:09 -0800 (PST)
MIME-Version: 1.0
Sender: customagenttony@gmail.com
Received: by 2002:a5d:5984:0:0:0:0:0 with HTTP; Sun, 11 Dec 2022 09:17:08
 -0800 (PST)
From:   Mrs Aisha Gaddafi <aishagaddafiaisha20@gmail.com>
Date:   Sun, 11 Dec 2022 09:17:08 -0800
X-Google-Sender-Auth: Fkl9BcCdvil9CjWnKbuyYi2r26g
Message-ID: <CAAV183S77Qp-1qOrg=vaxS7PAWeP80tVAiSG3YejQoMFJyrR3A@mail.gmail.com>
Subject: Greetings from Aisha Gaddafi,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORM_FRAUD_5,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,MILLION_USD,
        MONEY_FORM_SHORT,MONEY_FRAUD_5,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_FILL_THIS_FORM_SHORT,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY,
        URG_BIZ autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:42e listed in]
        [list.dnswl.org]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [customagenttony[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.6 MILLION_USD BODY: Talks about millions of dollars
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.6 URG_BIZ Contains urgent matter
        *  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
        *      information
        *  0.0 MONEY_FORM_SHORT Lots of money if you fill out a short form
        *  3.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 MONEY_FRAUD_5 Lots of money and many fraud phrases
        *  0.0 FORM_FRAUD_5 Fill a form and many fraud phrases
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I want to use this access to open a mutual communication with you
seeking your acceptance towards investing in your country under your
management as my partner, My name is Aisha  Gaddafi and presently
living in Oman, i am a Widow and single Mother with three Children,
the only biological Daughter of late Libyan President (Late Colonel
Muammar Gaddafi) and presently i am under political asylum protection
by the Omani Government.

I have funds worth " Seven Million Five Hundred Thousand United State
Dollars" $7.500.000.00 US Dollars which I want to entrust to you for
investment projects in your country. If you are willing to handle this
project on my behalf, kindly reply urgent to enable me provide you
more details to start the transfer process, I shall appreciate your
urgent response through my private email address below:

aishagaddafiaisha20@gmail.com

You can know more through the BBC news links below:

http://www.bbc.com/news/world-africa-19966059


Thanks
Yours Truly Aisha
