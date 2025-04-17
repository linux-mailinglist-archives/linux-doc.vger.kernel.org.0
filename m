Return-Path: <linux-doc+bounces-43511-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E836A926C7
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 20:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AF414A1077
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 18:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A001E98ED;
	Thu, 17 Apr 2025 18:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gmA9bYwh"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149AE1EB1BF
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 18:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744913786; cv=none; b=ZZ1aZdQJ9qjgKU44snorb1NwNOazn6XkVKhU81PlDojglHUrlvYzZXKGwvPiDLwn6s/F6w8ZakPks0qc/mu0J/fMJD6MRzJZ64eY5/nLuBTd42dFcJUPTYN6XBzvMS2sISTTF3EDmbBr1JLdJha65Ij8iQUDk0UosUCE9yt0mdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744913786; c=relaxed/simple;
	bh=jXPgA34u1lNSA7bi3gNWWVNOyhX2LV4sCHT6HZSTmT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FMAKbQeDiCqk1tnY+SFo+CEKBXjsck5rDnzQj5faHEU6TP3jiZH+QyXamwWy79b+MyEjfpeZscDjHlMnOYm/2f+IIHu4jTAwj0bYgIysHVPJ9iqmoWKj79n4GUOSYEhbqr4+g0fFTCqUiVi3BJXVpYa/6vQ6J2W76d1L+csWoX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gmA9bYwh; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so1794439a12.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 11:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744913781; x=1745518581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0JR72QzUITGmZ1eN8BgBmaLIcpaMnqlf8+OiLb+WQXw=;
        b=gmA9bYwhX4jsCgrzrjr0D2teHdKnqStrNi8CJtEYS6vuhXB2yEhfD1sFzB1h/K1kDI
         OmD9qVKBLcr4LhKSd+ZityFi99Pm5t6N/M+/4pQc7zEU+0xkvHgoviZAjKx+/yq2a8zv
         k620/CdNdSgXuvo2bBs+wW0HeDAqPcmS3Sg0o0no2qfH5E6nOumHi7no8+bVW3Bqqts2
         GIqXkhgGOUJg86uMEQKf3sd8n7c/dpPigyoVxMWLAu6idgdWfxBdC0iLLE77zt6D+5mT
         UQx+AhG9Gzof2KfsvxXFL5SfSXdOuQ+fUk30dbGUty4T+XrwpUtWirJuaPkmF62BmaXm
         4Ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744913781; x=1745518581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JR72QzUITGmZ1eN8BgBmaLIcpaMnqlf8+OiLb+WQXw=;
        b=Gek8sATbAZ+NzFdAjfucjrbVbnYwd5GTVxQDaqSZdQrodte90yLLldpR6ZB/k8OvvQ
         JIZCGGlSvMECXsWLSBpwyP4Y+ObVD0hVLFgH3Ghv10cr9lfz77Od2UKJ/UeeU2b69Gyk
         ygkKklyA6Rw25JrxnKoRCS1KEnSqnnreMcvqq2762AhCNFBtwgvaSGd1DL5CY4PYUPpF
         y/cRAFP+ryNRZiLsBSemfYKRWkeen2dygBljz04iF8XTQtnFNOqjZejSe01wbnnI3GnF
         eGMtKFUBHYjczBvNOBXuxBVWiCc51BWO23crb0WXOareHRPoQVsY5Lv3nk8uiy3TGJwu
         pcuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWfKetcSa+xlYl6zKeYNcHQhaMONfT6qwsKpvdPa9AocAuKeWhBQjiwpnhYYvwkJC+4uOZZJbkBPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze5+6tHIPrgZHxDxTw60CzVlT1dgMnUnNUb0uVeMEcJOr03Z9A
	G+kKzYrthEm4Rw1zF9E1ydOUun5JLC3PRW3527za5Bn3oaHpNZ/Z6Fi7vOC7HIQ=
X-Gm-Gg: ASbGncurRP/h6/MIDQ4t/cLsSZzBhXO8AXKqLl+Xh5tQLBL0/nvIjBln+BJgL7ewEBa
	xE5E3hxOIzNPvtBnh2PD/TyILApFBdb6dUajem3MrFuep2jXvgv95Rif1oXn/1sX9QV3Pr7vjql
	ORtlltAB+rcWOA/VwF7x6aRezd9nvenBqmCkZ09tV6GRXNLpEz0LOq3kzox51JX34rP04AJSP38
	O9awWJkKhdWmzCrKEQ9S4mAK/t3kmXysTtQgMYGNGURjMdI77IYGktY/Ra48t8hVJL6VVlljhPZ
	ThItvrjDXodB9eLHexcNU10YqldIf3KnBiWcdR+cG/KNOw==
X-Google-Smtp-Source: AGHT+IHlYeYhG6D/L5VXgVTeHR6fho6DQgzHvC8kg63I/TWXJGygxa9MOIz50mmV/UzPSs7obTPp5w==
X-Received: by 2002:a17:907:6e87:b0:aca:d861:877b with SMTP id a640c23a62f3a-acb42ba1438mr610635066b.49.1744913781206;
        Thu, 17 Apr 2025 11:16:21 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ec103a0sm25765466b.12.2025.04.17.11.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 11:16:20 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-pwm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] pwm: Fix various formatting issues in kernel-doc
Date: Thu, 17 Apr 2025 20:16:11 +0200
Message-ID: <20250417181611.2693599-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6887; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=jXPgA34u1lNSA7bi3gNWWVNOyhX2LV4sCHT6HZSTmT8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoAUVr1oiIuwsIiDv/3Q6DobtJ8PKnWlf+mh9mp eT8YmEh2bqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaAFFawAKCRCPgPtYfRL+ ThgGB/9/yk+rVcCQUl/5gQWMn4sWHPU1oIPLGuPABA786Oo0E6K2o+AffyoTfk8hF/6j2jZRXEo pCJZKlijFWbp5nbXHxqZdywY4e8Zd5qVzAPju+WDDsGK55bdoMQ/tkvvVUFh2kB1Te57c1NqKiv TKnUJZxJH3IB37B30hsR0KgaAXFRDMxivNpcaCVpWP1UvSqysjfrubKiHltxa3KHgh3x2a4UTzb u2A4INqSDOvtQ3w3UgpQOTqZXYL94qsMkqwfF9L51YAmoTS21rFEImwn985WbHqM/1DH0NAIqgA CA4JddOwbqIuPn7XcIbi5wmqGmq1NjNz34Gr7UmfwNhVq8gC
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Add Return and (where interesting) Context sections, fix some formatting
and drop documenting the internal function __pwm_apply().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello Jonathan,

On Thu, Apr 17, 2025 at 07:24:15AM -0600, Jonathan Corbet wrote:
> > --- a/drivers/pwm/core.c
> > +++ b/drivers/pwm/core.c
> > @@ -222,8 +222,10 @@ static int __pwm_write_waveform(struct pwm_chip *chip, struct pwm_device *pwm, c
> >   * Note however that the world doesn't stop turning when you call it, so when
> >   * doing
> >   *
> > - *         pwm_round_waveform_might_sleep(mypwm, &wf);
> > - *         pwm_set_waveform_might_sleep(mypwm, &wf, true);
> > + * .. code-block:: C
> > + *
> > + *   pwm_round_waveform_might_sleep(mypwm, &wf);
> > + *   pwm_set_waveform_might_sleep(mypwm, &wf, true);
> 
> Here I would just use an ordinary literal block rather than embedding
> Sphinx directives into the comment like that:
> 
>  * Note however that the world doesn't stop turning when you call it, so when
>  * doing::
>  *
>  *    pwm_round_waveform_might_sleep(mypwm, &wf);
>  *    pwm_set_waveform_might_sleep(mypwm, &wf, true);

Oh, that looks identically in the rendered output (though I didn't
compare pixel by pixel :-) and looks much better in the ASCII
representation. Adapted accordingly in this v2.

Thanks for your input
Uwe

 drivers/pwm/core.c  | 30 +++++++++++++++++++++---------
 include/linux/pwm.h |  8 +++++---
 2 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 079964961bd8..1f41c7a8cf1e 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -220,10 +220,10 @@ static int __pwm_write_waveform(struct pwm_chip *chip, struct pwm_device *pwm, c
  * pwm_set_waveform_might_sleep now.
  *
  * Note however that the world doesn't stop turning when you call it, so when
- * doing
+ * doing::
  *
- * 	pwm_round_waveform_might_sleep(mypwm, &wf);
- * 	pwm_set_waveform_might_sleep(mypwm, &wf, true);
+ *   pwm_round_waveform_might_sleep(mypwm, &wf);
+ *   pwm_set_waveform_might_sleep(mypwm, &wf, true);
  *
  * the latter might fail, e.g. because an input clock changed its rate between
  * these two calls and the waveform determined by
@@ -233,8 +233,9 @@ static int __pwm_write_waveform(struct pwm_chip *chip, struct pwm_device *pwm, c
  * value (in the order period_length_ns, duty_length_ns and then
  * duty_offset_ns). Only if this isn't possible, a value might grow.
  *
- * Returns 0 on success, 1 if at least one value had to be rounded up or a
+ * Returns: 0 on success, 1 if at least one value had to be rounded up or a
  * negative errno.
+ * Context: May sleep.
  */
 int pwm_round_waveform_might_sleep(struct pwm_device *pwm, struct pwm_waveform *wf)
 {
@@ -291,6 +292,9 @@ EXPORT_SYMBOL_GPL(pwm_round_waveform_might_sleep);
  *
  * Stores the current configuration of the PWM in @wf. Note this is the
  * equivalent of pwm_get_state_hw() (and not pwm_get_state()) for pwm_waveform.
+ *
+ * Returns: 0 on success or a negative errno
+ * Context: May sleep.
  */
 int pwm_get_waveform_might_sleep(struct pwm_device *pwm, struct pwm_waveform *wf)
 {
@@ -406,6 +410,10 @@ static int __pwm_set_waveform(struct pwm_device *pwm,
  * Note that even with exact = true, some rounding by less than 1 is
  * possible/needed. In the above example requesting .period_length_ns = 94 and
  * exact = true, you get the hardware configured with period = 93.5 ns.
+ *
+ * Returns: 0 on succes, 1 if was rounded up (if !@exact) or no perfect match was
+ * possible (if @exact), or a negative errno
+ * Context: May sleep.
  */
 int pwm_set_waveform_might_sleep(struct pwm_device *pwm,
 				 const struct pwm_waveform *wf, bool exact)
@@ -565,11 +573,6 @@ static bool pwm_state_valid(const struct pwm_state *state)
 	return true;
 }
 
-/**
- * __pwm_apply() - atomically apply a new state to a PWM device
- * @pwm: PWM device
- * @state: new state to apply
- */
 static int __pwm_apply(struct pwm_device *pwm, const struct pwm_state *state)
 {
 	struct pwm_chip *chip;
@@ -678,6 +681,9 @@ static int __pwm_apply(struct pwm_device *pwm, const struct pwm_state *state)
  * Cannot be used in atomic context.
  * @pwm: PWM device
  * @state: new state to apply
+ *
+ * Returns: 0 on success, or a negative errno
+ * Context: May sleep.
  */
 int pwm_apply_might_sleep(struct pwm_device *pwm, const struct pwm_state *state)
 {
@@ -719,6 +725,9 @@ EXPORT_SYMBOL_GPL(pwm_apply_might_sleep);
  * Not all PWM devices support this function, check with pwm_might_sleep().
  * @pwm: PWM device
  * @state: new state to apply
+ *
+ * Returns: 0 on success, or a negative errno
+ * Context: Any
  */
 int pwm_apply_atomic(struct pwm_device *pwm, const struct pwm_state *state)
 {
@@ -792,6 +801,9 @@ EXPORT_SYMBOL_GPL(pwm_get_state_hw);
  * This function will adjust the PWM config to the PWM arguments provided
  * by the DT or PWM lookup table. This is particularly useful to adapt
  * the bootloader config to the Linux one.
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ * Context: May sleep.
  */
 int pwm_adjust_config(struct pwm_device *pwm)
 {
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index bf0469b2201d..63a17d2b4ec8 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -218,6 +218,8 @@ static inline void pwm_init_state(const struct pwm_device *pwm,
  *
  * pwm_get_state(pwm, &state);
  * duty = pwm_get_relative_duty_cycle(&state, 100);
+ *
+ * Returns: rounded relative duty cycle multiplied by @scale
  */
 static inline unsigned int
 pwm_get_relative_duty_cycle(const struct pwm_state *state, unsigned int scale)
@@ -244,8 +246,8 @@ pwm_get_relative_duty_cycle(const struct pwm_state *state, unsigned int scale)
  * pwm_set_relative_duty_cycle(&state, 50, 100);
  * pwm_apply_might_sleep(pwm, &state);
  *
- * This functions returns -EINVAL if @duty_cycle and/or @scale are
- * inconsistent (@scale == 0 or @duty_cycle > @scale).
+ * Returns: 0 on success or ``-EINVAL`` if @duty_cycle and/or @scale are
+ * inconsistent (@scale == 0 or @duty_cycle > @scale)
  */
 static inline int
 pwm_set_relative_duty_cycle(struct pwm_state *state, unsigned int duty_cycle,
@@ -351,7 +353,7 @@ struct pwm_chip {
  * pwmchip_supports_waveform() - checks if the given chip supports waveform callbacks
  * @chip: The pwm_chip to test
  *
- * Returns true iff the pwm chip support the waveform functions like
+ * Returns: true iff the pwm chip support the waveform functions like
  * pwm_set_waveform_might_sleep() and pwm_round_waveform_might_sleep()
  */
 static inline bool pwmchip_supports_waveform(struct pwm_chip *chip)

base-commit: 061f087f5d0bcae9f43ae0101121fcaa999d2809
-- 
2.47.2


